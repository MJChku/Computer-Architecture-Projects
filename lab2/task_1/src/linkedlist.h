#ifndef _H_LIST_
#define _H_LIST_
typedef struct node {
   int start;
   int end;
   int numMSHR;
   struct node *next;
}node;

typedef struct req{
  
  int order;
  uint32_t address;
  int numMSHR;
  uint32_t *value;
  int controller_latency;
  int controller_latency_back;
  struct req *next;
}request;
void insert(int start, int end, int num, struct node** head);
void delete(int num, struct node** head);
request* find_req(int num, request *head);
void delete_req(int num, request** head);
#endif