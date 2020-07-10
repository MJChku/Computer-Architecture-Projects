#include "cache_ins.h"
#include "cache_data.h"
#include "l1_cache_manager.h"
#include "pipe.h"
#include "shell.h"
#include "cache_data.h"
#include "cache_ins.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <stdbool.h>
#include <stdint.h>
//#define DEBUG
#define QSIZE ((int)(16))
INDEX INDEXs[16];
int global_signal[16];
uint32_t global_address[16];
uint32_t global_value[16];
int global_type[16];
int global_cache[16];
bool global_cancel[16] = {0};
queue_node ready_queue[16];
void l1_fill_request(int serial, uint32_t *return_value);
void index_complete(uint32_t address);
int index_find(uint32_t address);
int index_miss(uint32_t address);
void l1_insert_queue(int signal, uint32_t value);
void l1_execute_queue();

void l1_fill_request(int serial, uint32_t *return_value){
    // type 1 read, type 2 write;
    index_complete(global_address[serial]);
    if(global_cache[serial] == 1){
        if(global_type[serial] == 1){
        l1_write_insert(global_address[serial], return_value, global_value[serial]);  
        }
        #ifdef DEBUG
           printf("value %08x \n\n", return_value[0]);
        #endif
        if(global_type[serial] == 0){
        l1_read_insert(global_address[serial], return_value);
        }
    }else{
        #ifdef DEBUG
            printf("value %08x \n\n", return_value[0]);
        #endif
       ins_read_insert(global_address[serial], return_value);
    }
     int offset = global_address[serial] & 0x1F;
     uint32_t mem = return_value[offset/4];

    if(global_cancel[serial] == 1){
        // cancelled;
        return;
    }
    l1_insert_queue(global_signal[serial], mem);
}


int index_miss(uint32_t address){
    #ifdef DEBUG
         printf("index miss \n");
    #endif
    int i = 0, index;
    for( i=0; i < 16; i++){
        if(INDEXs[i].valid == 0){
           INDEXs[i].valid = 1;
           INDEXs[i].address = address;
           INDEXs[i].done = 0;
           return i;
        }
    }
  
}
void index_complete(uint32_t address){
    #ifdef DEBUG
         printf("index complete \n");
    #endif
    int index = index_find(address);
    INDEXs[index].done = 1;
    INDEXs[index].valid = 0;
}
int index_find(uint32_t address){
    #ifdef DEBUG
         printf("index find");
    #endif
    int i = 0;
    for( i=0; i < 16; i++){
        if(address==INDEXs[i].address)
          return i;
    }
}


void l1_insert_queue(int signal, uint32_t value){
    #ifdef DEBUG
         printf("l1_insert_queue \n");
    #endif
    int i;
    for(i = 0; i < QSIZE; i++){
        if(ready_queue[i].valid == 0 ){
           ready_queue[i].valid = 1;
           //fill after 15 cycles;
           ready_queue[i].cycle = stat_cycles + 1;
           ready_queue[i].value = value;
           ready_queue[i].signal = signal;
           return;
        }
    }
}
// (scanned every scan to serve memory request)
void l1_execute_queue(){
    #ifdef DEBUG
         printf("l1_execute_queue \n");
    #endif
    int i;
    for(i = 0; i < QSIZE; i++){
        if(ready_queue[i].valid == 1 && ready_queue[i].cycle <= stat_cycles){
               #ifdef DEBUG
                 printf("fill %d \n", i);
               #endif
               fill_pipe(ready_queue[i].signal, ready_queue[i].value);            
               ready_queue[i].valid = 0;
        }
    }
}

void cancel_on_wait(int index){
    if(index == -1){
        return;
    }
    if(INDEXs[index].valid == 1){ 
       global_cancel[index] = 1;
    }
    
}