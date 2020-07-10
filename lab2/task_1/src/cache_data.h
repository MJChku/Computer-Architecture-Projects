#ifndef _CACHE_DATA_H_
#define _CACHE_DATA_H_
#include <stdint.h>
void l1_write_32(uint32_t address, uint32_t value, int signal);
void l1_read_32(uint32_t address, int signal);
void init_l1_data();
void l1_read_insert(uint32_t address, uint32_t* return_value);
void l1_write_insert(uint32_t address, uint32_t* return_value, uint32_t value );


#endif