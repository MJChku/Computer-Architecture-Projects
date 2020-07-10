#ifndef _L1_CACHE_MANAGER_
#define _L1_CACHE_MANAGER_
#include <stdbool.h>
#include <stdint.h>

typedef struct {
    uint32_t tag;
    bool valid;
    bool dirty;
    int recent;
    int frequency;
    uint8_t cache[32];
} cache_region_t;

typedef struct{
    int valid;
    uint32_t address;
    int done;
} INDEX;

typedef struct{
    int valid;
    int signal;
    int cycle;
    uint32_t value;

} queue_node;

void l1_fill_request(int serial, uint32_t *return_value);
void index_complete(uint32_t address);
int index_find(uint32_t address);
int index_miss(uint32_t address);
void l1_execute_queue();
void l1_insert_queue(int signal, uint32_t value);
extern INDEX INDEXs[16];
extern int global_cache[16];
extern int global_signal[16];
extern uint32_t global_address[16];
extern uint32_t global_value[16];
extern int global_type[16];
extern bool  global_cancel[16];
extern queue_node ready_queue[16];
void cancel_on_wait(int index);
#endif