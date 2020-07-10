#ifndef _CACHE_DATA_H_
#define _CACHE_DATA_H_

uint32_t cache_data_read_32(uint32_t address);
void cache_write_32(uint32_t address, uint32_t value);
void init_cache_data();

#endif