#ifndef _DRAM_H_
#define _DRAM_H_

void mem_request(uint32_t address, int numMSHR, uint32_t* value);
void DRAM_cycle();

#endif