#include<stdlib.h>
#include<stdio.h>
#include"klee.h"

struct list_el {
   int val;
   struct list_el * next;
};

typedef struct list_el item;

int main() {
   item * curr, * head, *end, *end_cond;
   int i, sum;


   head = NULL;

   for(i=1;i<=10;i++) {
      curr = (item *)malloc(sizeof(item));

      if(i == 0) {
        end_cond = curr;
      }
      curr->val = i;
      curr->next  = head;
      head = curr;
   }

   klee_make_symbolic(&end, sizeof(end), "END");
   //klee_assume(end < end_cond);

   for(curr = head ; curr != end; curr = curr->next ) {
      printf("%d ", curr->val);
   }
  // curr = head;
  // printf("%u ", curr);

 //  if(curr < end) {
 //    sum =0;
 //  } else {
 //    sum =1;
 //  }

   return sum;
}
