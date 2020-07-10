#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <stdbool.h>
#include <stdint.h>
#include "linkedlist.h"
#include "pipe.h"
#include "l2_cache.h"
//#define DEBUG
bool check_avai(int start, int end, node* head);
void schedual();
int validate(request* req);
void set_ready(request* req, int type);
//0 is not scheduable, 1 is row hit, 2 is row miss, 3 is row conflict
int numReq = 0;
int numCyc = 0;
int cycle_elaps = 0;
uint32_t* bank_amp[8]; 
node* bankstat[8];
node* comaddr_bus;
node* data_bus;
request* request_list;
request* request_candi;
#define MASKPREFIX 0XFFFFFFE0

// void ini_mem_controller(){
//   bankstat[0] = (node*) malloc(sizeof(node));
//   bankstat[1] = (node*) malloc(sizeof(node));
//   bankstat[2] = (node*) malloc(sizeof(node));
//   bankstat[3] = (node*) malloc(sizeof(node));
//   bankstat[4] = (node*) malloc(sizeof(node));
//   bankstat[5] = (node*) malloc(sizeof(node));
//   bankstat[6] = (node*) malloc(sizeof(node));
//   bankstat[7] = (node*) malloc(sizeof(node));
//   node* comaddr_bus = (node* )malloc(sizeof(node));
//   node* data_bus = (node*) malloc(sizeof(node));
//   //request* request_list = (request*) malloc(sizeof(request));
//   //request* request_candi = (request*) malloc(sizeof(request));
// }

//call to  L2 cache fillMSHR();
//to be called by L2 cache
// void mem_request(uint32_t address, int numMSHR, uint32_t* value){  
//        #ifdef DEBUG
//                  printf("mem_request \n");
//        #endif
//         uint32_t prefix = address & MASKPREFIX;
//         uint32_t return_value[8];
//         int i,j=0;
//         for (i = 0; i < 32;i+=4){
//             return_value[j] = mem_read_32(prefix+i);
//             j++;
//         }
//       l2_fill_request(numMSHR, return_value);
// }

void mem_request(uint32_t address, int numMSHR, uint32_t* value){  
    #ifdef DEBUG
         printf("mem_request \n");
    #endif
  request* current;
  if(request_list == NULL){
    request_list = malloc(sizeof(request));
    current = request_list;
    current->address = address;
    current->numMSHR =numMSHR;
    current->value = value;
    current->controller_latency_back = 5;
    current->next = NULL;
    return;
  }
  while(current != NULL){
    current = current->next;
  }
  current = malloc(sizeof(request));
  current->address = address;
  current->numMSHR = numMSHR;
  current->value = value;
  current->controller_latency_back = 5;
  current->next = NULL;
  return;
}

void schedual(){
    #ifdef DEBUG
         printf("schedual \n");
    #endif
  if(request_list == NULL ){
       return;
  }
  request *current = request_list;
  request *earliest = NULL;
  request *rowhit = NULL;
  int type;
  while(current != NULL){
    int val = validate(current);
    if(val == 0){
       current = current->next;
    }else{
       if(earliest == NULL){
         earliest = current;
         type = val;
       }
       if(val == 1){
          // process queue from top to bottom, early request are put in the front. 
          rowhit = current;
           break;
       }
       current = current->next;
    }    
  }
  if(rowhit != NULL){
     set_ready(rowhit, 1);
  }
  if(rowhit == NULL && earliest != NULL){
     set_ready(earliest, type);
  }
}

int validate(request* req){
  #ifdef DEBUG
         printf("validate \n");
  #endif

  int numbank = (req->address >> 5) & 0x7;
  int row = (req->address >> 16) & 0xFFFF;
  node* bankhead = bankstat[numbank];
  
  //row hit Read/Write ComAddr 0,1,2,3, bank 0-99, data bus 100-149 
  if(bank_amp[numbank] && *(bank_amp[numbank]) == req->address){
    if(   check_avai(numCyc,numCyc+99, bankhead) &&
          check_avai(numCyc,numCyc+3, comaddr_bus) &&
          check_avai(numCyc+100,numCyc+149, data_bus) ){
       return 1;
    } 
  }else{
    //row miss Activate  Read/Write ComAddr 0-3 100-103 bank 0-99 100-199 data bus200-249
  if(bank_amp[numbank] == NULL){
     if(
     check_avai(numCyc,numCyc+199, bankhead)&& 
     check_avai(numCyc,numCyc+3, comaddr_bus) &&
     check_avai(numCyc+100,numCyc+103, comaddr_bus) &&     
     check_avai(numCyc+200,numCyc+249, data_bus) ){
     return 2;
     }  
  }else{
    //row conflict Precharge Activate Read/Write ComAddr 0-3 100-103 200-203 bank 0-299 data bus 300-349
   if(
     check_avai(numCyc,numCyc+299, bankhead)&& 
     check_avai(numCyc,numCyc+3, comaddr_bus) &&
     check_avai(numCyc+100,numCyc+103, comaddr_bus) &&
     check_avai(numCyc+200,numCyc+203, comaddr_bus) &&          
     check_avai(numCyc+300,numCyc+349, data_bus) ){
       return 3;
    }
  }
  //  if(bank_amp[numbank] && *bank_amp[numbank] == req->address){
  //   if(   check_avai(numCyc,numCyc+4, bankhead) &&
  //         check_avai(numCyc,numCyc+3, comaddr_bus) &&
  //         check_avai(numCyc+1,numCyc+5, data_bus) ){
  //      return 1;
  //   } 
  // }else{
  //   //row miss Activate  Read/Write ComAddr 0-3 100-103 bank 0-99 100-199 data bus200-249
  // if(bank_amp[numbank] == NULL){
  //    if(
  //    check_avai(numCyc,numCyc+8, bankhead)&& 
  //    check_avai(numCyc,numCyc+3, comaddr_bus) &&
  //    check_avai(numCyc+1,numCyc+5, comaddr_bus) &&     
  //    check_avai(numCyc+6,numCyc+10, data_bus) ){
  //           return 2;
  //    }  
  // }else{
  //   //row conflict Precharge Activate Read/Write ComAddr 0-3 100-103 200-203 bank 0-299 data bus 300-349
  //  if(
  //    check_avai(numCyc,numCyc+8, bankhead)&& 
  //    check_avai(numCyc,numCyc+3, comaddr_bus) &&
  //    check_avai(numCyc+1,numCyc+5, comaddr_bus) &&
  //    check_avai(numCyc+6,numCyc+10, comaddr_bus) &&          
  //    check_avai(numCyc+11,numCyc+14, data_bus) ){
  //      return 3;
  //   }
  // }
}
  return 0;	
}


void set_ready(request* req, int type){
  #ifdef DEBUG
         printf("set_ready \n");
  #endif
  int numbank = (req->address >> 5) & 0x7;
  int row = (req->address >> 16) & 0xFFFF;
  node* bankhead = bankstat[numbank];
  if(!bank_amp[numbank]){
    bank_amp[numbank] = malloc(sizeof(uint32_t));
  }
  *bank_amp[numbank] = req->address;
  switch(type){
    case 1:
      insert(numCyc,numCyc+99, req->numMSHR,&bankhead);
      insert(numCyc,numCyc+3, req->numMSHR,&comaddr_bus);
      insert(numCyc,numCyc+49, req->numMSHR,&data_bus);
      break;
    case 2:
      insert(numCyc,numCyc+199, req->numMSHR,&bankhead);
      insert(numCyc,numCyc+3, req->numMSHR,&comaddr_bus);
      insert(numCyc+100,numCyc+103, req->numMSHR, &comaddr_bus);
      insert(numCyc+200,numCyc+249, req->numMSHR,&data_bus);
      break;
    case 3:
      insert(numCyc,numCyc+299, req->numMSHR, &bankhead);
      insert(numCyc,numCyc+3, req->numMSHR, &comaddr_bus);
      insert(numCyc+100,numCyc+103, req->numMSHR, &comaddr_bus);
      insert(numCyc+200,numCyc+203, req->numMSHR, &comaddr_bus);
      insert(numCyc+300,numCyc+349, req->numMSHR,&data_bus);
      break;
    default:
     break;
  }
  request *current = malloc(sizeof(request));;
  current->address = req->address;
    current->numMSHR =req->numMSHR;
    current->value = req->value;
    current -> next = NULL;  
  if(request_candi == NULL){
    request_candi = current;

  }else{
    current->next = request_candi;
    request_candi = current;    
  }
  delete_req(req->numMSHR, &request_list);
}

void execute(){
  #ifdef DEBUG
         printf("execute \n");
  #endif

  node *current = data_bus;
  while(current){
    if(current->end <= numCyc){
      request* req = find_req(current->numMSHR, request_candi);
      if(req->controller_latency_back > 0){
        req->controller_latency_back--;
        current = current->next;
        continue;
      }
      if(req == NULL){
        delete(current->end, &data_bus);
      }
      // read;
      if(req && !req->value){
        int i, j = 0;
        uint32_t return_value[8];
        uint32_t prefix = req->address & MASKPREFIX;
        for (i = 0; i < 32;i+=4){
            return_value[j] = mem_read_32(prefix+i);
            j++;
        }
      #ifdef DEBUG
        printf("fill request");
      #endif
      l2_fill_request(req->numMSHR, return_value);
      delete_req(req->numMSHR, &request_candi);
      delete(current->end, &data_bus);
     }
   }
   current = current->next;
  }
}
bool check_avai(int start, int end, node* head){
   #ifdef DEBUG
         printf("check_avai \n");
    #endif

   node* current = head;
   if(!head){
      return true;
   }
   if(current){
      if(current->end < numCyc && head != data_bus){
         delete(current->end, &head);
      }
     if( end < current->start){
        return true;
     }
   }
   while(current && current->next){
     if(start > current->end && end < current->next->start){
        return true;
     }
     if(current->end < numCyc && head != data_bus){
         delete(current->end, &head);  
      }
      current = current->next;
   }  
   if(current && start > current->end){
      if(current->end < numCyc && head != data_bus){
         delete(current->end, &head);
      }
      return true;
   }
   return false;
}

void DRAM_cycle(){
  numCyc = stat_cycles;
    schedual();
    execute();
}






























