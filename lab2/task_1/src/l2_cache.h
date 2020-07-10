#ifndef _L2_CACHE_INS_H_
#define _L2_CACHE_INS_H_

void l2_fill_request(int numMSHR, uint32_t *return_value);
void l2_write_32(uint32_t address, int signal, uint32_t *value);
void l2_read_32(uint32_t address, int signal);
void l2_execute_queue();
void l2_send_mem_request();
void init_l2_data();
#endif