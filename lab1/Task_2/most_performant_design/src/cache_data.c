#include "shell.h"
#include "cache_data.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <stdbool.h>

typedef struct {
    uint32_t tag;
    bool valid;
    bool dirty;
    int recent;
    int frequency;
    uint8_t cache[32];
} cache_region_t;

uint32_t read_insert_new_data(int set,uint32_t address,int offset);
uint32_t write_insert_new(int set,uint32_t address,int offset, uint32_t value);
uint32_t fetch_mem_data(int set,int line,uint32_t address, int offset);
uint32_t write_mem(int set,int line,uint32_t address, int offset, uint32_t value);
int get_least_recent_data(int line);
void set_most_recent_data(int set, int dest);
int get_least_frequent_data(int line);
void increase_frequency_data(int set, int dest);
void clear_frequency_data(int set,int dest);

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

void init_cache_data() {                                           
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
}


/***************************************************************/
/*                                                             */
/* Procedure: cache_data_data_32                                */
/*                                                             */
/* Purpose: Read a 32-bit word from cache                      */
/*                                                             */
/***************************************************************/
uint32_t cache_data_read_32(uint32_t address)
{   
    int set = NWAY_DATA*(( (uint32_t) (address >> SHIFTBLOCK) & MASKSET ));
    int tag = (int)(address >> SHIFTTAG); // count 21
    int offset = (int) address & MASKBLOCK;
    int i;
    
    for(i = 0;i < NWAY_DATA; i++){
        if (CACHE_DATA_REGIONS[set+i].tag == tag ){
            if(CACHE_DATA_REGIONS[set+i].valid == 1){
                increase_frequency_data(set,i);
                return
                    (CACHE_DATA_REGIONS[set+i].cache[offset+3] << 24) |
                    (CACHE_DATA_REGIONS[set+i].cache[offset+2] << 16) |
                    (CACHE_DATA_REGIONS[set+i].cache[offset+1] <<  8) |
                    (CACHE_DATA_REGIONS[set+i].cache[offset+0] <<  0);
            }
        }
    }
    return read_insert_new_data(set,address,offset);

}

/***************************************************************/
/*                                                             */
/* Procedure: cache_insert_new_data                            */
/*                                                             */
/* Purpose: Insert new block to cache to read                  */
/*                                                             */
/***************************************************************/
uint32_t read_insert_new_data(int set,uint32_t address,int offset){
    #ifdef DEBUG
        printf("start read_insert_new_data \n");
    #endif
    int valid_line = -1;
    int i;
    for(i = 0;i < NWAY_DATA; i++){
        if(CACHE_DATA_REGIONS[set+i].valid == 0 ){
            valid_line = i;
            break;
        }
    }
    if(valid_line >= 0){
        return fetch_mem_data(set,valid_line,address,offset);
        
    }else{
        i = get_least_recent_data(set);
        //i = get_least_frequent_data(set);
        return fetch_mem_data(set,i,address,offset);
    }

}

/***************************************************************/
/*                                                             */
/* Procedure: cache_write_32                                   */
/*                                                             */
/* Purpose: Write a 32-bit word to cache                       */
/*                                                             */
/***************************************************************/
void cache_write_32(uint32_t address, uint32_t value)
{
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
            set_most_recent_data(set,i);
            increase_frequency_data(set,i);
            return;       
        }
    }
    //TODO CACHE miss due to tag missmatch
   write_insert_new(set,address,offset,value);
}

/***************************************************************/
/*                                                             */
/* Procedure: write_insert_new                                 */
/*                                                             */
/* Purpose: Insert new block to cache to write                  */
/*                                                             */
/***************************************************************/

uint32_t write_insert_new(int set,uint32_t address,int offset, uint32_t value){
    #ifdef DEBUG
        printf("start read_insert_new_data \n");
    #endif
    int valid_line = -1;
    int i;
    for(i = 0;i < NWAY_DATA; i++){
        if(CACHE_DATA_REGIONS[set+i].valid == 0 ){
            valid_line = i;
            break;
        }
    }
    if(valid_line >= 0){
        return write_mem(set,valid_line,address,offset,value);
        
    }else{
        i = get_least_recent_data(set);
        //i = get_least_frequent_data(set);
        write_mem(set,i,address,offset,value);
    }

}

/***************************************************************/
/*                                                             */
/* Procedure: write_mem                                        */
/*                                                             */
/* Purpose: write a block to memory                            */
/*                                                             */
/***************************************************************/

uint32_t write_mem(int set,int line,uint32_t address, int offset, uint32_t value){
    stat_cycles += 50;
    int dest = set+line;

    if(CACHE_DATA_REGIONS[dest].valid = 1 && CACHE_DATA_REGIONS[dest].dirty == 1 ){
        uint32_t prefix = (CACHE_DATA_REGIONS[dest].tag << SHIFTTAG) | (set << SHIFTBLOCK);
        
        uint32_t temp_add, temp_value;
        int i;
        for( i = 0; i < NBLOCK; i=i+4){ 
            temp_add = prefix + i; 
            temp_value = 
            (CACHE_DATA_REGIONS[dest].cache[i+3] <<24) |
            (CACHE_DATA_REGIONS[dest].cache[i+2] <<16) |
            (CACHE_DATA_REGIONS[dest].cache[i+1] << 8) |
            (CACHE_DATA_REGIONS[dest].cache[i+0] << 0) ;
            mem_write_32(temp_add,temp_value);
        }
        
          CACHE_DATA_REGIONS[dest].valid = 0;
          clear_frequency_data(set,line);
    }

    int tag = (int)(address >> SHIFTTAG); // count 21 
    uint32_t prefix = address & MASKPREFIX;
    CACHE_DATA_REGIONS[dest].tag = tag;
    
    int i;
    for( i = 0; i < NBLOCK; i=i+4){ 
        uint32_t temp = mem_read_32(prefix + i);
        CACHE_DATA_REGIONS[dest].cache[i+3] = (temp >> 24) & 0xFF;
        CACHE_DATA_REGIONS[dest].cache[i+2] = (temp >> 16) & 0xFF;
        CACHE_DATA_REGIONS[dest].cache[i+1] = (temp >> 8) & 0xFF;
        CACHE_DATA_REGIONS[dest].cache[i+0] = (temp >> 0) & 0xFF;
    }

    CACHE_DATA_REGIONS[dest].valid = 1;
    CACHE_DATA_REGIONS[dest].dirty = 1;
    set_most_recent_data(set,line);
    CACHE_DATA_REGIONS[dest].cache[offset+3] = (value >> 24) & 0xFF;
    CACHE_DATA_REGIONS[dest].cache[offset+2] = (value >> 16) & 0xFF;
    CACHE_DATA_REGIONS[dest].cache[offset+1] = (value >> 8) & 0xFF;
    CACHE_DATA_REGIONS[dest].cache[offset+0] = (value >> 0) & 0xFF;
    increase_frequency_data(set,line);

}

/***************************************************************/
/*                                                             */
/* Procedure: fetch_mem_data                                   */
/*                                                             */
/* Purpose: fetch a block from  memory                         */
/*                                                             */
/***************************************************************/
uint32_t fetch_mem_data(int set,int line,uint32_t address, int offset){
    stat_cycles += 50;
    int dest = set+line;
    if(CACHE_DATA_REGIONS[dest].valid = 1 && CACHE_DATA_REGIONS[dest].dirty == 1 ){
        uint32_t prefix = (CACHE_DATA_REGIONS[dest].tag << SHIFTTAG) | (set << SHIFTBLOCK);
        uint32_t temp_add, temp_value;
        int i;
        for( i = 0; i < NBLOCK; i=i+4){ 
            temp_add = prefix + i; 
            temp_value = 
            (CACHE_DATA_REGIONS[dest].cache[i+3] <<24) |
            (CACHE_DATA_REGIONS[dest].cache[i+2] <<16) |
            (CACHE_DATA_REGIONS[dest].cache[i+1] << 8) |
            (CACHE_DATA_REGIONS[dest].cache[i+0] << 0) ;
            mem_write_32(temp_add,temp_value);
        }
        CACHE_DATA_REGIONS[dest].valid = 0;
        clear_frequency_data(set,line);
    }
    int tag = (int)(address >> SHIFTTAG); // count 21 
    uint32_t prefix = address & MASKPREFIX;
    CACHE_DATA_REGIONS[dest].tag = tag;
    uint32_t mem = mem_read_32(address);
    uint32_t value;
    
    int i;
    for( i = 0; i < NBLOCK; i=i+4){ 
        uint32_t temp = mem_read_32(prefix + i);
        CACHE_DATA_REGIONS[dest].cache[i+3] = (temp >> 24) & 0xFF;
        CACHE_DATA_REGIONS[dest].cache[i+2] = (temp >> 16) & 0xFF;
        CACHE_DATA_REGIONS[dest].cache[i+1] = (temp >> 8) & 0xFF;
        CACHE_DATA_REGIONS[dest].cache[i+0] = (temp >> 0) & 0xFF;
    }

    CACHE_DATA_REGIONS[dest].valid = 1;
    CACHE_DATA_REGIONS[dest].dirty = 0;
    set_most_recent_data(set,line);
    return mem;
}

// least recently used
/***************************************************************/
/*                                                             */
/* Procedure: get_least_recent_data                            */
/*                                                             */
/* Purpose: get least recent block in a set                    */
/*                                                             */
/***************************************************************/
int get_least_recent_data(int line){
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
void set_most_recent_data(int set, int dest){
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
int get_least_frequent_data(int line){
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
void increase_frequency_data(int set, int dest){
    CACHE_DATA_REGIONS[set+dest].frequency++;
}

/***************************************************************/
/*                                                             */
/* Procedure: clear_frequency_data                             */
/*                                                             */
/* Purpose: clear frequency                                    */
/*                                                             */
/***************************************************************/
void clear_frequency_data(int set,int dest){
    CACHE_DATA_REGIONS[set+dest].frequency = 0;
}

