#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include "linkedlist.h"
//#define DEBUG
void sort(struct node **h);
//insert link at the first location
void insert(int start, int end, int num, struct node** head) {
   #ifdef DEBUG
         printf("insert \n");
    #endif

   //create a link
   struct node *link = malloc(sizeof(struct node));
   link->start = start;
   link->end = end;
   link->numMSHR = num;
   link->next = NULL;
   struct node* current = *head;
   if(current == NULL){
      *head = link;
      return;
   }else{
      if(end < current->start){
         link->next = current;
         *head = link;
         return;
      }
   }
   while(current && current->next){
      if(start > current->end && end<current->next->start){
         link->next = current->next;
         current->next = link;
         return;
      }
      current = current->next;
   }
   //append to end;
   current->next = link;
   return;
   //sort(head);
}


//is list empty
bool isEmpty(struct node *head) {
   return head == NULL;
}

void delete(int num, struct node** head){
   #ifdef DEBUG
         printf("delete \n");
    #endif

   struct node* current = *head;
   struct node* previous = NULL;
	
   if(*head == NULL) {
      return;
   }
   while(current->end != num) {
      //if it is last node
      if(current->next == NULL) {
         return;
      } else {
         previous = current;
         current = current->next;
      }
   }
   //found a match, update the link
   if(current == *head) {
      //change first to point to next link
      *head = (*head)->next;
   } else {
      //bypass the current link
      previous->next = current->next;
      free(current);  
   } 
    
}

request* find_req(int num, request *head){
   #ifdef DEBUG
         printf("find_req \n");
    #endif

   request *current = head;
   while(current != NULL){
      if(current->numMSHR == num){
         return current;
      }else{
         current = current->next;
      }
   }
   return NULL;
}


void delete_req(int num, request** head){
   #ifdef DEBUG
         printf("delete_req \n");
    #endif
   request* current = *head;
   request* previous = NULL;
	
   if(*head == NULL) {
      printf("no element");
      return;
   }

   while(current->numMSHR != num) {
      //if it is last node
      if(current->next == NULL) {
         return;
      } else {
         previous = current;
         current = current->next;
      }
   }
   //found a match, update the link
   if(current == *head) {
      //change first to point to next link
      *head = (*head)->next;
   } else {

      //bypass the current link
      previous->next = current->next;
   }    
	free(current);
}

void sort(struct node **h)
{
    int i,j,a;

    struct node *temp1;
    struct node *temp2;

    for(temp1=*h;temp1!=NULL;temp1=temp1->next)
      {
        for(temp2=temp1->next;temp2!=NULL;temp2=temp2->next)
          { 
            if(temp2->start < temp1->start)
              {
                a = temp1->start;
                temp1->start = temp2->start;
                temp2->start = a;
              }
           }
       }
}