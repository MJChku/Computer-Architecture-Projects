#ifndef _CACHE_INS_H_
#define _CACHE_INS_H_
#include <stdint.h>
void ins_read_32(uint32_t address, int signal);
void init_l1_ins();
void ins_read_insert(uint32_t address, uint32_t* return_value);
#endif