
#include "shell.h"
#include "l2_cache.h"
#include "DRAM.h"
#include "l1_cache_manager.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <stdbool.h>
//#define DEBUG
typedef struct{
    int valid;
    int signal;
    int cycle;
    uint32_t value[8];
} l2_node;

typedef struct{
    int valid;
    int waiting;
    uint32_t address;
     int numMSHR;
    uint32_t* value;
} mem_node;

#define MEM_QSIZE ((int)(16))
mem_node mem_queue[16];
#define QSIZE ((int)(16))
l2_node l2_ready_queue[16];
INDEX MSHRs[16];
void l2_fill_request(int numMSHR, uint32_t *return_value);
void l2_read_insert(uint32_t address, uint32_t* return_value);
void l2_write_insert(uint32_t address, uint32_t* return_value, uint32_t* value );
void l2_fetch_cache(int set,int line,uint32_t address, uint32_t* return_value);
void l2_write_cache(int set,int line,uint32_t address,uint32_t* return_value, uint32_t* value);
void MSHR_complete(uint32_t address);
int MSHR_find(uint32_t address);
int MSHR_miss(uint32_t address);
void l2_insert_queue(int singal, uint32_t* value, int wait);
void l2_execute_queue();
int l2_get_least_recent(int line);
void l2_set_most_recent(int set, int dest);
int l2_get_least_frequent(int line);
void l2_increase_frequency(int set, int dest);
void l2_clear_frequency(int set,int dest);
void l2_send_mem_request();
void l2_insert_mem_queue(uint32_t address, int numMSHR, uint32_t* value);
int l2_global_signal[16];
uint32_t l2_global_address[16];
uint32_t* l2_global_value[16];
int l2_global_type[16];
#define NWAY_L2 ((int)(16))
#define NSET ((int)512)
#define NBLOCK ((int)32)
#define CACHE_NREGIONS ((int)(8192))
#define SHIFTBLOCK ((int)5)
#define SHIFTTAG ((int)14)
#define MASKBLOCK 0x1F
#define MASKSET 0x1FF
#define MASKPREFIX 0XFFFFFFE0
cache_region_t CACHE_L2_REGIONS[8192];


/***************************************************************/
/*                                                             */
/* Procedure: l2_fill_request                                  */
/*                                                             */
/* Purpose: called by DRAM when fill                           */
/*                                                             */
/***************************************************************/
void l2_fill_request(int numMSHR, uint32_t *return_value){
    // type 0 read, type 1 write;
    #ifdef DEBUG
         printf("l2_fill_request \n");
    #endif
    MSHR_complete(l2_global_address[numMSHR]);
    if(l2_global_type[numMSHR] == 1){
      l2_write_insert(l2_global_address[numMSHR], return_value, l2_global_value[numMSHR]);  
    }

    if(l2_global_type[numMSHR] == 0){
      l2_read_insert(l2_global_address[numMSHR], return_value);
    }

    l2_insert_queue(l2_global_signal[numMSHR], return_value, 0);

}
void init_l2_data() {
    int i;
    for (i = 0; i < CACHE_NREGIONS; i++) {
        //CACHE_L2_REGIONS[i].cache = malloc(32);
        memset(CACHE_L2_REGIONS[i].cache, 0, NBLOCK);
        CACHE_L2_REGIONS[i].tag = -1;
        CACHE_L2_REGIONS[i].valid = 0;
        CACHE_L2_REGIONS[i].dirty = 0;
        CACHE_L2_REGIONS[i].recent = 0;
        CACHE_L2_REGIONS[i].frequency = 0;

    }
    for (i = 0;i<QSIZE;i++){
        l2_ready_queue[i].valid = 0;
    }
}


void l2_write_32(uint32_t address, int signal, uint32_t *value)
{
    #ifdef DEBUG
         printf("l2_write_32 \n");
    #endif
    //its l1 dirty evition to l2 which is not modeled. Unless, the write requires load from DRAM.
    int set = NWAY_L2*(( (uint32_t) (address >> SHIFTBLOCK) & MASKSET ));
    int tag = (int)(address >> SHIFTTAG); // count 21
    int offset = (int) (address & MASKBLOCK );
    int i;
    for( i = 0;i < NWAY_L2; i++){
        if (CACHE_L2_REGIONS[set+i].tag == tag ){
            int j,k = 0;
            for(j = 0; j < NBLOCK; j+=4 ){
              CACHE_L2_REGIONS[set+i].cache[j+3] = (value[k] >> 24) & 0xFF;
              CACHE_L2_REGIONS[set+i].cache[j+2] = (value[k] >> 16) & 0xFF;
              CACHE_L2_REGIONS[set+i].cache[j+1] = (value[k] >> 8) & 0xFF;
              CACHE_L2_REGIONS[set+i].cache[j+0] = (value[k] >> 0) & 0xFF;
              k++;
            }
            CACHE_L2_REGIONS[set+i].dirty = 1;
            CACHE_L2_REGIONS[set+i].valid = 1;
            l2_set_most_recent(set,i);
            l2_increase_frequency(set,i);
            return;       
        }
    }
    l2_write_insert( address, NULL, value );
    // int index = MSHR_miss(address);
    // l2_global_value[index] = value;
    // l2_global_address[index] = address;
    // l2_global_signal[index] = signal;
    // l2_global_type[index] = 1;
    // mem_request(address, index, NULL);
}


void l2_read_32(uint32_t address, int signal)
{   
    #ifdef DEBUG
         printf("l2_read_32 \n");
    #endif
    int set = NWAY_L2*(( (uint32_t) (address >> SHIFTBLOCK) & MASKSET ));
    int tag = (int)(address >> SHIFTTAG); // count 21
    int offset = (int) address & MASKBLOCK;
    int i;
    
    for(i = 0;i < NWAY_L2; i++){
        if (CACHE_L2_REGIONS[set+i].tag == tag ){
            if(CACHE_L2_REGIONS[set+i].valid == 1){
                l2_increase_frequency(set,i);
                int j;
                int k = 0;
                uint32_t value[NBLOCK/4];
                for( j = 0; j < NBLOCK; j=j+4){ 
                    value[k] = 
                   (CACHE_L2_REGIONS[set+i].cache[i+3] <<24) |
                   (CACHE_L2_REGIONS[set+i].cache[i+2] <<16) |
                   (CACHE_L2_REGIONS[set+i].cache[i+1] << 8) |
                   (CACHE_L2_REGIONS[set+i].cache[i+0] << 0) ;
                     k++;
                 }
                l2_insert_queue(signal,value,15);
                return;
            }
        } 
    }
    
    int index = MSHR_miss(address);
    l2_global_address[index] = address;
    l2_global_signal[index] = signal;
    l2_global_type[index] = 0;
    l2_insert_mem_queue(address, index, NULL);
    //mem_request(address, index, NULL);

}

void l2_read_insert(uint32_t address, uint32_t* return_value){
    #ifdef DEBUG
        printf("start l2 read_insert_new_data \n");
    #endif
    int set = NWAY_L2*(( (uint32_t) (address >> SHIFTBLOCK) & MASKSET ));
    int valid_line = -1;
    int i;
    for(i = 0;i < NWAY_L2; i++){
        if(CACHE_L2_REGIONS[set+i].valid == 0 ){
            valid_line = i;
            break;
        }
    }
    if(valid_line >= 0){
        return l2_fetch_cache(set,valid_line,address,return_value);
        
    }else{
        i = l2_get_least_recent(set);
        //i = get_least_frequent(set);
        return l2_fetch_cache(set,i,address, return_value);
    }

}

void l2_write_insert(uint32_t address, uint32_t* return_value, uint32_t *value ){
    #ifdef DEBUG
        printf("start l2 write_insert_new \n");
         fflush(stdout);
    #endif
    int set = NWAY_L2*(( (uint32_t) (address >> SHIFTBLOCK) & MASKSET ));
    int valid_line = -1;
    int i;
    for(i = 0;i < NWAY_L2; i++){
        if(CACHE_L2_REGIONS[set+i].valid == 0 ){
            valid_line = i;
            break;
        }
    }
    if(valid_line >= 0){
        l2_write_cache(set,valid_line,address,return_value,value);
        
    }else{
        i = l2_get_least_recent(set);
        //i = get_least_frequent(set);
        l2_write_cache(set,i,address,return_value,value);
    }

}

void l2_fetch_cache(int set,int line,uint32_t address, uint32_t* return_value){
    #ifdef DEBUG
         printf("l2_fetch_cache \n");
    #endif
    int dest = set+line;
    //dirty evition
    int i,j;
    if(CACHE_L2_REGIONS[dest].valid == 1 && CACHE_L2_REGIONS[dest].dirty == 1 ){
        uint32_t prefix = (CACHE_L2_REGIONS[dest].tag << SHIFTTAG) | (set << SHIFTBLOCK);
        uint32_t temp_add;
        uint32_t temp_value[NBLOCK/4];
        j = 0;
        for( i = 0; i < NBLOCK; i=i+4){ 
            temp_add = prefix + i; 
            temp_value[j] = 
            (CACHE_L2_REGIONS[dest].cache[i+3] <<24) |
            (CACHE_L2_REGIONS[dest].cache[i+2] <<16) |
            (CACHE_L2_REGIONS[dest].cache[i+1] << 8) |
            (CACHE_L2_REGIONS[dest].cache[i+0] << 0) ;
            //dirty evition not modeled
            mem_write_32(temp_add,temp_value[j]);
            j++;
        }
        
        CACHE_L2_REGIONS[dest].valid = 0;
        l2_clear_frequency(set,line);
    }
        int tag = (int)(address >> SHIFTTAG); // count 21 
        CACHE_L2_REGIONS[dest].tag = tag;
        uint32_t* temp = return_value;
        j = 0;
        for( i = 0; i < NBLOCK; i=i+4){     
            CACHE_L2_REGIONS[dest].cache[i+3] = (temp[j] >> 24) & 0xFF;
            CACHE_L2_REGIONS[dest].cache[i+2] = (temp[j] >> 16) & 0xFF;
            CACHE_L2_REGIONS[dest].cache[i+1] = (temp[j] >> 8) & 0xFF;
            CACHE_L2_REGIONS[dest].cache[i+0] = (temp[j] >> 0) & 0xFF;
            j++;
        }

        CACHE_L2_REGIONS[dest].dirty = 0;
        l2_set_most_recent(set, line);
}

void l2_write_cache(int set,int line,uint32_t address,uint32_t* return_value, uint32_t* value){
    #ifdef DEBUG
         printf("l2_write_cache \n");
         fflush(stdout);
    #endif
    int dest = set+line;
    //dirty evition
    if(CACHE_L2_REGIONS[dest].valid == 1 && CACHE_L2_REGIONS[dest].dirty == 1 ){
        uint32_t prefix = (CACHE_L2_REGIONS[dest].tag << SHIFTTAG) | (set << SHIFTBLOCK);
        uint32_t temp_add;
        uint32_t temp_value[NBLOCK/4];
        int i;
        int j = 0;
        for( i = 0; i < NBLOCK; i=i+4){ 
            temp_add = prefix + i; 
            temp_value[j] = 
            (CACHE_L2_REGIONS[dest].cache[i+3] <<24) |
            (CACHE_L2_REGIONS[dest].cache[i+2] <<16) |
            (CACHE_L2_REGIONS[dest].cache[i+1] << 8) |
            (CACHE_L2_REGIONS[dest].cache[i+0] << 0) ; 
            mem_write_32(temp_add,temp_value[j]);
            j++;
        }
        CACHE_L2_REGIONS[dest].valid = 0;
        l2_clear_frequency(set,line);
    }

        int offset = (int) (address & MASKBLOCK );
        int tag = (int)(address >> SHIFTTAG); // count 21 
        CACHE_L2_REGIONS[dest].tag = tag;
        int i;
        uint32_t* temp = return_value;
        int j = 0;

        CACHE_L2_REGIONS[dest].valid = 1;
        CACHE_L2_REGIONS[dest].dirty = 1;
        l2_set_most_recent(set, line);
        // the following part is only redundent when block size of l1 and l2 cache are the same.
        temp = value; 
        j = 0;
        for( i = 0; i < NBLOCK; i=i+4){     
            CACHE_L2_REGIONS[dest].cache[i+3] = (temp[j] >> 24) & 0xFF;
            CACHE_L2_REGIONS[dest].cache[i+2] = (temp[j] >> 16) & 0xFF;
            CACHE_L2_REGIONS[dest].cache[i+1] = (temp[j] >> 8) & 0xFF;
            CACHE_L2_REGIONS[dest].cache[i+0] = (temp[j] >> 0) & 0xFF;
            j++;
        }
        l2_increase_frequency(set, line);

}

// least recently used
/***************************************************************/
/*                                                             */
/* Procedure: get_least_recent                            */
/*                                                             */
/* Purpose: get least recent block in a set                    */
/*                                                             */
/***************************************************************/
int l2_get_least_recent(int line){
    #ifdef DEBUG
         printf("l2 get least \n");
    #endif
    int i;
    for( i=0; i < NWAY_L2; i++){
        if (CACHE_L2_REGIONS[line+i].recent == 0){
            return i;
        }
    }
}

/***************************************************************/
/*                                                             */
/* Procedure: set_most_recent                             */
/*                                                             */
/* Purpose: set a block to be most recent and update others    */
/*                                                             */
/***************************************************************/
void l2_set_most_recent(int set, int dest){
    if(dest > NWAY_L2 - 1){
        return;
    }
    int i;
    for(i = 0; i < NWAY_L2; i++){
        if(CACHE_L2_REGIONS[set+i].recent > CACHE_L2_REGIONS[set+dest].recent)
            CACHE_L2_REGIONS[set+i].recent--;
    }
    CACHE_L2_REGIONS[set+dest].recent = NWAY_L2 - 1;
}

//least frequently used
// least recently used
/***************************************************************/
/*                                                             */
/* Procedure: get_least_recent                            */
/*                                                             */
/* Purpose: get least recent block in a set                    */
/*                                                             */
/***************************************************************/
int l2_get_least_frequent(int line){
    #ifdef DEBUG
         printf("l2_get least \n");
    #endif
    int i;
    int min = 0;
    int min_f = CACHE_L2_REGIONS[line+0].frequency;
    for( i=0; i < NWAY_L2; i++){
        if (CACHE_L2_REGIONS[line+i].frequency < min_f ){
            min = i;
            min_f = CACHE_L2_REGIONS[line+i].frequency;
        }
    }
    return min;
}

/***************************************************************/
/*                                                             */
/* Procedure: increase_frequency                          */
/*                                                             */
/* Purpose: increase frequency                                 */
/*                                                             */
/***************************************************************/
void l2_increase_frequency(int set, int dest){
    
    CACHE_L2_REGIONS[set+dest].frequency++;
}

/***************************************************************/
/*                                                             */
/* Procedure: clear_frequency                             */
/*                                                             */
/* Purpose: clear frequency                                    */
/*                                                             */
/***************************************************************/
void l2_clear_frequency(int set,int dest){
    CACHE_L2_REGIONS[set+dest].frequency = 0;
}

int MSHR_miss(uint32_t address){
    #ifdef DEBUG
         printf("MSHR miss \n");
    #endif
    int i = 0, index;
    for( i=0; i < 16; i++){
        if(MSHRs[i].valid == 0){
           MSHRs[i].valid = 1;
           MSHRs[i].address = address;
           MSHRs[i].done = 0;
           return i;
        }
    }
  
}
void MSHR_complete(uint32_t address){
    #ifdef DEBUG
         printf(" MSHR_complete \n");
    #endif
    int index = MSHR_find(address);
    MSHRs[index].done = 1;
    MSHRs[index].valid = 0;
}
int MSHR_find(uint32_t address){
    #ifdef DEBUG
         printf("MSHR_find \n");
    #endif
    int i = 0;
    for( i=0; i < 16; i++){
        if(address==MSHRs[i].address){
          return i;
        }
    }
}


void l2_insert_queue(int signal, uint32_t *value, int wait){
    #ifdef DEBUG
         printf("l2_insert_queue \n");
    #endif
    int i;
    for(i = 0; i < QSIZE; i++){
        if(l2_ready_queue[i].valid == 0 ){
           l2_ready_queue[i].valid = 1;
           l2_ready_queue[i].cycle = stat_cycles + wait;
           l2_ready_queue[i].signal = signal;
           int j;
           for( j = 0; j<8;j++){
               l2_ready_queue[i].value[j] = value[j];
            }  
           return;
        }
    }
}

// TODO add serve queue (scanned every scan to serve memory request)
void l2_execute_queue(){
    #ifdef DEBUG
         printf("l2_execute_queue \n");
    #endif
    int i;
    for(i = 0; i < QSIZE; i++){
        if(l2_ready_queue[i].valid == 1 && l2_ready_queue[i].cycle <= stat_cycles){ 
            #ifdef DEBUG
              printf("execute deliver %d\n %08x \n",i, l2_ready_queue[i].value[0]);     
            #endif
             uint32_t return_value[8];
            int j;
            for (j = 0; j<8;j++){
              return_value[j] = l2_ready_queue[i].value[j];
            }
            l1_fill_request(l2_ready_queue[i].signal, return_value);
            l2_ready_queue[i].valid = 0;
        }
    }
  
}


void l2_insert_mem_queue(uint32_t address, int numMSHR, uint32_t* value){  
    #ifdef DEBUG
         printf("l2_mem_queue \n");
    #endif
    int i;
    for(i = 0; i < MEM_QSIZE; i++){
        if(mem_queue[i].valid == 0 ){
            mem_queue[i].valid = 1;
            mem_queue[i].waiting = 5;
            mem_queue[i].address = address;
            mem_queue[i].numMSHR = numMSHR;
            mem_queue[i].value = value;  
           return;
        }
    }
}
void l2_send_mem_request(){
    #ifdef DEBUG
         printf("l2_mem_queue \n");
    #endif
    int i;
    for(i = 0; i < MEM_QSIZE; i++){
        if(mem_queue[i].waiting > 0){
            mem_queue[i].waiting --;
        }else{
            if(mem_queue[i].valid == 1){
            mem_queue[i].valid = 0;
            mem_request(mem_queue[i].address,
            mem_queue[i].numMSHR,
            mem_queue[i].value);
            }
        }
    }
  
}
