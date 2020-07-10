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
#define QSIZE ((int)(16))
void l1_read_insert(uint32_t address, uint32_t* return_value);
void l1_write_insert(uint32_t address, uint32_t* return_value, uint32_t value );
void l1_fetch_cache(int set,int line,uint32_t address, uint32_t* return_value);
void l1_write_cache(int set,int line,uint32_t address,uint32_t* return_value, uint32_t value);

int l1_get_least_recent(int line);
void l1_set_most_recent(int set, int dest);
int l1_get_least_frequent(int line);
void l1_increase_frequency(int set, int dest);
void l1_clear_frequency(int set,int dest);
#define NWAY_DATA ((int)(8))
#define NSET ((int)256)
#define NBLOCK ((int)32)
#define CACHE_NREGIONS ((int)(2048))
#define SHIFTBLOCK ((int)5)
#define SHIFTTAG ((int)13)
#define MASKBLOCK 0x1F
#define MASKSET 0xFF
#define MASKPREFIX 0XFFFFFFE0
cache_region_t CACHE_DATA_REGIONS[2048];


/***************************************************************/
/*                                                             */
/* Procedure: init_cache_data                                  */
/*                                                             */
/* Purpose: initilize cache data                               */
/*                                                             */
/***************************************************************/


void init_l1_data() { 
    printf("init_l1_data \n");                                         
    int i;
    for (i = 0; i < CACHE_NREGIONS; i++) {
        //CACHE_DATA_REGIONS[i].cache = malloc(32);
        memset(CACHE_DATA_REGIONS[i].cache, 0, NBLOCK);
        CACHE_DATA_REGIONS[i].tag = -1;
        CACHE_DATA_REGIONS[i].valid = 0;
        CACHE_DATA_REGIONS[i].dirty = 0;
        CACHE_DATA_REGIONS[i].recent = 0;
        CACHE_DATA_REGIONS[i].frequency = 0;

    }
    for (i = 0;i<QSIZE;i++){
        ready_queue[i].valid = 0;
    }
}


/***************************************************************/
/*                                                             */
/* Procedure: cache_write_32                                   */
/*                                                             */
/* Purpose: Write a 32-bit word to cache,dirty evition         */
/*                                                             */
/***************************************************************/
void l1_write_32(uint32_t address, uint32_t value, int signal)
{
    #ifdef DEBUG
      printf("l1_write_32 \n");
    #endif 
    // Signal is NULL;
    //its l1 dirty evition to l1 which is not modeled. Unless, the write requires load from DRAM.
    int set = NWAY_DATA*(( (uint32_t) (address >> SHIFTBLOCK) & MASKSET ));
    int tag = (int)(address >> SHIFTTAG); // count 21
    int offset = (int) (address & MASKBLOCK );
    int i;
    for( i = 0;i < NWAY_DATA; i++){
        if (CACHE_DATA_REGIONS[set+i].tag == tag ){
        
            CACHE_DATA_REGIONS[set+i].cache[offset+3] = (value >> 24) & 0xFF;
            CACHE_DATA_REGIONS[set+i].cache[offset+2] = (value >> 16) & 0xFF;
            CACHE_DATA_REGIONS[set+i].cache[offset+1] = (value >> 8) & 0xFF;
            CACHE_DATA_REGIONS[set+i].cache[offset+0] = (value >> 0) & 0xFF;
        
            CACHE_DATA_REGIONS[set+i].dirty = 1;
            CACHE_DATA_REGIONS[set+i].valid = 1;
            l1_set_most_recent(set,i);
            l1_increase_frequency(set,i);
            l1_insert_queue(signal,value);
            //printf("hit");
            return;       
        }
    }
    int index = index_miss(address);
    set_on_wait(signal,index);
    global_cache[index] = 1;
    global_cancel[index] = 0;
    global_value[index] = value;
    global_address[index] = address;
    global_signal[index] = signal;
    global_type[index] = 1;
    l2_read_32(address, index);
}


/***************************************************************/
/*                                                             */
/* Procedure: cache_data_data_32                                */
/*                                                             */
/* Purpose: Read a 32-bit word from cache                      */
/*                                                             */
/***************************************************************/
void l1_read_32(uint32_t address, int signal)
{   
    #ifdef DEBUG
         printf("l1_read_32 \n");
    #endif
    int set = NWAY_DATA*(( (uint32_t) (address >> SHIFTBLOCK) & MASKSET ));
    int tag = (int)(address >> SHIFTTAG); // count 21
    int offset = (int) address & MASKBLOCK;
    int i;
    
    for(i = 0;i < NWAY_DATA; i++){
        if (CACHE_DATA_REGIONS[set+i].tag == tag ){
            if(CACHE_DATA_REGIONS[set+i].valid == 1){
                l1_increase_frequency(set,i);
                int j;
                uint32_t value =
                (CACHE_DATA_REGIONS[set+i].cache[offset+3] <<24) |
                (CACHE_DATA_REGIONS[set+i].cache[offset+2] <<16) |
                (CACHE_DATA_REGIONS[set+i].cache[offset+1] << 8) |
                (CACHE_DATA_REGIONS[set+i].cache[offset+0] << 0) ;
                //printf("hit");
                l1_insert_queue(signal,value);
                return;
            }
        } 
    }
    
    int index = index_miss(address);
    set_on_wait(signal,index);
    global_cache[index] = 1;
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
void l1_read_insert(uint32_t address, uint32_t* return_value){

    #ifdef DEBUG
        printf("start l1_read_insert_new_data \n");
    #endif
    int set = NWAY_DATA*(( (uint32_t) (address >> SHIFTBLOCK) & MASKSET ));
    int valid_line = -1;
    int i;
    for(i = 0;i < NWAY_DATA; i++){
        if(CACHE_DATA_REGIONS[set+i].valid == 0 ){
            valid_line = i;
            break;
        }
    }
    if(valid_line >= 0){
        return l1_fetch_cache(set,valid_line,address,return_value);
        
    }else{
        i = l1_get_least_recent(set);
        //i = get_least_frequent_data(set);
        return l1_fetch_cache(set,i,address, return_value);
    }

}

/***************************************************************/
/*                                                             */
/* Procedure: write_insert_new                                 */
/*                                                             */
/* Purpose: Insert new block to cache to write                  */
/*                                                             */
/***************************************************************/

void l1_write_insert(uint32_t address, uint32_t* return_value, uint32_t value ){
    #ifdef DEBUG
        printf("start l1_read_insert_new_data \n");
    #endif
    int set = NWAY_DATA*(( (uint32_t) (address >> SHIFTBLOCK) & MASKSET ));
    int valid_line = -1;
    int i;
    for(i = 0;i < NWAY_DATA; i++){
        if(CACHE_DATA_REGIONS[set+i].valid == 0 ){
            valid_line = i;
            break;
        }
    }
    if(valid_line >= 0){
        l1_write_cache(set,valid_line,address,return_value,value);
        
    }else{
        i = l1_get_least_recent(set);
        //i = get_least_frequent_data(set);
        l1_write_cache(set,i,address,return_value,value);
    }

}

/***************************************************************/
/*                                                             */
/* Procedure: fetch_mem_data                                   */
/*                                                             */
/* Purpose: fetch a block from  memory                         */
/*                                                             */
/***************************************************************/
void l1_fetch_cache(int set,int line,uint32_t address, uint32_t* return_value){
     #ifdef DEBUG
         printf("l1_fetch_cache \n");
    #endif
    int dest = set+line;
    //dirty evition
    int i,j;
    if(CACHE_DATA_REGIONS[dest].valid == 1 && CACHE_DATA_REGIONS[dest].dirty == 1 ){
        
        uint32_t prefix = (CACHE_DATA_REGIONS[dest].tag << SHIFTTAG) | (set << SHIFTBLOCK);
        uint32_t temp_add;
        uint32_t temp_value[NBLOCK/4];
        j = 0;
        for( i = 0; i < NBLOCK; i=i+4){ 
            temp_add = prefix + i; 
            temp_value[j] = 
            (CACHE_DATA_REGIONS[dest].cache[i+3] <<24) |
            (CACHE_DATA_REGIONS[dest].cache[i+2] <<16) |
            (CACHE_DATA_REGIONS[dest].cache[i+1] << 8) |
            (CACHE_DATA_REGIONS[dest].cache[i+0] << 0) ;
            j++;
        }
        l2_write_32(prefix,-1,temp_value);
        CACHE_DATA_REGIONS[dest].valid = 0;
        l1_clear_frequency(set,line);
    }
        int tag = (int)(address >> SHIFTTAG); // count 21 
        CACHE_DATA_REGIONS[dest].tag = tag;
        uint32_t* temp = return_value;
        j = 0;
        for( i = 0; i < NBLOCK; i=i+4){     
            CACHE_DATA_REGIONS[dest].cache[i+3] = (temp[j] >> 24) & 0xFF;
            CACHE_DATA_REGIONS[dest].cache[i+2] = (temp[j] >> 16) & 0xFF;
            CACHE_DATA_REGIONS[dest].cache[i+1] = (temp[j] >> 8) & 0xFF;
            CACHE_DATA_REGIONS[dest].cache[i+0] = (temp[j] >> 0) & 0xFF;
            j++;
        }
        CACHE_DATA_REGIONS[dest].valid = 1;
        CACHE_DATA_REGIONS[dest].dirty = 0;
        l1_set_most_recent(set, line);
        l1_increase_frequency(set, line);
}

void l1_write_cache(int set,int line,uint32_t address,uint32_t* return_value, uint32_t value){
    #ifdef DEBUG
         printf("l1_write_cache \n");
    #endif
    int dest = set+line;
    //dirty evition
    int i,j;
    if(CACHE_DATA_REGIONS[dest].valid == 1 && CACHE_DATA_REGIONS[dest].dirty == 1 ){
        uint32_t prefix = (CACHE_DATA_REGIONS[dest].tag << SHIFTTAG) | (set << SHIFTBLOCK);
        uint32_t temp_add;
        uint32_t temp_value[NBLOCK/4];
        j = 0;
        for( i = 0; i < NBLOCK; i=i+4){ 
            temp_add = prefix + i; 
            temp_value[j] = 
            (CACHE_DATA_REGIONS[dest].cache[i+3] <<24) |
            (CACHE_DATA_REGIONS[dest].cache[i+2] <<16) |
            (CACHE_DATA_REGIONS[dest].cache[i+1] << 8) |
            (CACHE_DATA_REGIONS[dest].cache[i+0] << 0) ;
            j++;
        }
        // triger l2 to directly evict to memory.
        l2_write_32(prefix,-1,temp_value);
        CACHE_DATA_REGIONS[dest].valid = 0;
        l1_clear_frequency(set,line);
    }

        int offset = (int) (address & MASKBLOCK );
        int tag = (int)(address >> SHIFTTAG); // count 21 
        CACHE_DATA_REGIONS[dest].tag = tag;
        uint32_t* temp = return_value; 
        j = 0;
        for( i = 0; i < NBLOCK; i=i+4){     
            CACHE_DATA_REGIONS[dest].cache[i+3] = (temp[j] >> 24) & 0xFF;
            CACHE_DATA_REGIONS[dest].cache[i+2] = (temp[j] >> 16) & 0xFF;
            CACHE_DATA_REGIONS[dest].cache[i+1] = (temp[j] >> 8) & 0xFF;
            CACHE_DATA_REGIONS[dest].cache[i+0] = (temp[j] >> 0) & 0xFF;
            j++;
        }

        CACHE_DATA_REGIONS[dest].valid = 1;
        CACHE_DATA_REGIONS[dest].dirty = 1;
        l1_set_most_recent(set, line);
        CACHE_DATA_REGIONS[dest].cache[offset+3] = (value >> 24) & 0xFF;
        CACHE_DATA_REGIONS[dest].cache[offset+2] = (value >> 16) & 0xFF;
        CACHE_DATA_REGIONS[dest].cache[offset+1] = (value >> 8) & 0xFF;
        CACHE_DATA_REGIONS[dest].cache[offset+0] = (value >> 0) & 0xFF;
        l1_increase_frequency(set, line);

}

// least recently used
/***************************************************************/
/*                                                             */
/* Procedure: get_least_recent_data                            */
/*                                                             */
/* Purpose: get least recent block in a set                    */
/*                                                             */
/***************************************************************/
int l1_get_least_recent(int line){
    #ifdef DEBUG
         printf("l1_get least \n");
    #endif
    int i;
    for( i=0; i < NWAY_DATA; i++){
        if (CACHE_DATA_REGIONS[line+i].recent == 0){
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
void l1_set_most_recent(int set, int dest){
    #ifdef DEBUG
         printf("l1_set recent \n");
    #endif
    if(dest > NWAY_DATA - 1){
        return;
    }
    int i;
    for(i=0; i < NWAY_DATA; i++){
        if(CACHE_DATA_REGIONS[set+i].recent > CACHE_DATA_REGIONS[set+dest].recent)
            CACHE_DATA_REGIONS[set+i].recent--;
    }
    CACHE_DATA_REGIONS[set+dest].recent = NWAY_DATA - 1;
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
int l1_get_least_frequent(int line){
    #ifdef DEBUG
         printf("l1_get least frequent \n");
    #endif
    int i;
    int min = 0;
    int min_f = CACHE_DATA_REGIONS[line+0].frequency;
    for( i=0; i < NWAY_DATA; i++){
        if (CACHE_DATA_REGIONS[line+i].frequency < min_f ){
            min = i;
            min_f = CACHE_DATA_REGIONS[line+i].frequency;
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
void l1_increase_frequency(int set, int dest){
    CACHE_DATA_REGIONS[set+dest].frequency++;
}

/***************************************************************/
/*                                                             */
/* Procedure: clear_frequency_data                             */
/*                                                             */
/* Purpose: clear frequency                                    */
/*                                                             */
/***************************************************************/
void l1_clear_frequency(int set,int dest){
    CACHE_DATA_REGIONS[set+dest].frequency = 0;
}

