#include "shell.h"
#include "pipe.h"
#include "l2_cache.h"
#include "cache_data.h"
#include "l1_cache_manager.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <stdbool.h>
//#define DEBUG
void ins_read_insert(uint32_t address, uint32_t* return_value);
void ins_fetch_cache(int set,int line,uint32_t address, uint32_t* return_value);
int ins_get_least_recent(int line);
void ins_set_most_recent(int set, int dest);
int ins_get_least_frequent(int line);
void ins_increase_frequency(int set, int dest);
void ins_clear_frequency(int set,int dest);
#define NWAY_INS ((int)(4))
#define NSET ((int)64)
#define NBLOCK ((int)32)
#define CACHE_NREGIONS ((int)(256))
#define SHIFTBLOCK ((int)5)
#define SHIFTTAG ((int)11)
#define MASKBLOCK 0x1F
#define MASKSET 0x3F
#define MASKPREFIX 0XFFFFFFE0
cache_region_t CACHE_INS_REGIONS[256];



void init_l1_ins() { 
    printf("init_ins_data \n");                                         
    int i;
    for (i = 0; i < CACHE_NREGIONS; i++) {
        //CACHE_INS_REGIONS[i].cache = malloc(32);
        memset(CACHE_INS_REGIONS[i].cache, 0, NBLOCK);
        CACHE_INS_REGIONS[i].tag = -1;
        CACHE_INS_REGIONS[i].valid = 0;
        CACHE_INS_REGIONS[i].dirty = 0;
        CACHE_INS_REGIONS[i].recent = 0;
        CACHE_INS_REGIONS[i].frequency = 0;

    }
}


/***************************************************************/
/*                                                             */
/* Procedure: cache_data_data_32                                */
/*                                                             */
/* Purpose: Read a 32-bit word from cache                      */
/*                                                             */
/***************************************************************/
void ins_read_32(uint32_t address, int signal)
{   
    #ifdef DEBUG
         printf("ins_read_32 \n");
    #endif
    int set = NWAY_INS*(( (uint32_t) (address >> SHIFTBLOCK) & MASKSET ));
    int tag = (int)(address >> SHIFTTAG); // count 21
    int offset = (int) address & MASKBLOCK;
    int i;
    
    for(i = 0;i < NWAY_INS; i++){
        //printf("diff %08x \n", tag^CACHE_INS_REGIONS[set+i].tag);
        if (CACHE_INS_REGIONS[set+i].tag == tag ){
            if(CACHE_INS_REGIONS[set+i].valid == 1){
                ins_increase_frequency(set,i);
                int j;
                uint32_t value =
                (CACHE_INS_REGIONS[set+i].cache[offset+3] <<24) |
                (CACHE_INS_REGIONS[set+i].cache[offset+2] <<16) |
                (CACHE_INS_REGIONS[set+i].cache[offset+1] << 8) |
                (CACHE_INS_REGIONS[set+i].cache[offset+0] << 0) ;
                l1_insert_queue(signal,value);
                return;
            }
            printf("hit");
        } 
    }
    
    int index = index_miss(address);
    set_on_wait(signal,index);
    global_cache[index] = 0;
    global_cancel[index] = 0;
    global_address[index] = address;
    global_signal[index] = signal;
    global_type[index] = 0;
    l2_read_32(address, index);

}

/***************************************************************/
/*                                                             */
/* Procedure: cache_insert_new_data                            */
/*                                                             */
/* Purpose: Insert new block to cache to read                  */
/*                                                             */
/***************************************************************/
void ins_read_insert(uint32_t address, uint32_t* return_value){

    #ifdef DEBUG
        printf("start ins_read_insert_new_data \n");
    #endif
    int set = NWAY_INS*(( (uint32_t) (address >> SHIFTBLOCK) & MASKSET ));
    int valid_line = -1;
    int i;
    for(i = 0;i < NWAY_INS; i++){
        if(CACHE_INS_REGIONS[set+i].valid == 0 ){
            valid_line = i;
            break;
        }
    }
    if(valid_line >= 0){
        return ins_fetch_cache(set,valid_line,address,return_value);
        
    }else{
        i = ins_get_least_recent(set);
        //i = get_least_frequent_data(set);
        return ins_fetch_cache(set,i,address, return_value);
    }

}

/***************************************************************/
/*                                                             */
/* Procedure: fetch_mem_data                                   */
/*                                                             */
/* Purpose: fetch a block from  memory                         */
/*                                                             */
/***************************************************************/
void ins_fetch_cache(int set,int line,uint32_t address, uint32_t* return_value){
     #ifdef DEBUG
         printf("ins_fetch_cache \n");
    #endif
    int dest = set+line;
    //dirty evition
    int i,j;
    int tag = (int)(address >> SHIFTTAG); // count 21 
    CACHE_INS_REGIONS[dest].tag = tag;
    uint32_t* temp = return_value;
    j = 0;
    uint32_t prefix = address & MASKPREFIX;
    for( i = 0; i < NBLOCK; i=i+4){
        #ifdef DEBUG
           printf("INS addr %08x value %08x \n", prefix, temp[j]);   
        #endif
        CACHE_INS_REGIONS[dest].cache[i+3] = (temp[j] >> 24) & 0xFF;
        CACHE_INS_REGIONS[dest].cache[i+2] = (temp[j] >> 16) & 0xFF;
        CACHE_INS_REGIONS[dest].cache[i+1] = (temp[j] >> 8) & 0xFF;
        CACHE_INS_REGIONS[dest].cache[i+0] = (temp[j] >> 0) & 0xFF;
        j++;
    }
    CACHE_INS_REGIONS[dest].valid = 1;
    CACHE_INS_REGIONS[dest].dirty = 0;
    ins_set_most_recent(set, line);
    ins_increase_frequency(set,line);
}


// least recently used
/***************************************************************/
/*                                                             */
/* Procedure: get_least_recent_data                            */
/*                                                             */
/* Purpose: get least recent block in a set                    */
/*                                                             */
/***************************************************************/
int ins_get_least_recent(int line){
    #ifdef DEBUG
         printf("ins_get least \n");
    #endif
    int i;
    for( i=0; i < NWAY_INS; i++){
        if (CACHE_INS_REGIONS[line+i].recent == 0){
            return i;
        }
    }
}

/***************************************************************/
/*                                                             */
/* Procedure: set_most_recent_data                             */
/*                                                             */
/* Purpose: set a block to be most recent and update others    */
/*                                                             */
/***************************************************************/
void ins_set_most_recent(int set, int dest){
    #ifdef DEBUG
         printf("ins_set recent \n");
    #endif
    if(dest > NWAY_INS - 1){
        return;
    }
    int i;
    for(i=0; i < NWAY_INS; i++){
        if(CACHE_INS_REGIONS[set+i].recent > CACHE_INS_REGIONS[set+dest].recent)
            CACHE_INS_REGIONS[set+i].recent--;
    }
    CACHE_INS_REGIONS[set+dest].recent = NWAY_INS - 1;
}

//least frequently used
// least recently used
/***************************************************************/
/*                                                             */
/* Procedure: get_least_recent_data                            */
/*                                                             */
/* Purpose: get least recent block in a set                    */
/*                                                             */
/***************************************************************/
int ins_get_least_frequent(int line){
    #ifdef DEBUG
         printf("ins_get least frequent \n");
    #endif
    int i;
    int min = 0;
    int min_f = CACHE_INS_REGIONS[line+0].frequency;
    for( i=0; i < NWAY_INS; i++){
        if (CACHE_INS_REGIONS[line+i].frequency < min_f ){
            min = i;
            min_f = CACHE_INS_REGIONS[line+i].frequency;
        }
    }
    return min;
}

/***************************************************************/
/*                                                             */
/* Procedure: increase_frequency_data                          */
/*                                                             */
/* Purpose: increase frequency                                 */
/*                                                             */
/***************************************************************/
void ins_increase_frequency(int set, int dest){
    CACHE_INS_REGIONS[set+dest].frequency++;
}

/***************************************************************/
/*                                                             */
/* Procedure: clear_frequency_data                             */
/*                                                             */
/* Purpose: clear frequency                                    */
/*                                                             */
/***************************************************************/
void ins_clear_frequency(int set,int dest){
    CACHE_INS_REGIONS[set+dest].frequency = 0;
}
