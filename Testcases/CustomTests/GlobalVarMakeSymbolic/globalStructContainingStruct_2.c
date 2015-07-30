#include"klee.h"
#include <stdio.h>

   typedef struct {
         int x;
         int *y;
           }ptType;

   typedef struct {
         int x;
         ptType *y;
           }stType;

  stType z;

int foo(int x) {
    if(z.y->x == 0) {
      x ++;
    }  else {
      x--;
    }
    
  return x + *(z.y->y);
}


int main(int argc, char** argv) {
  int x = 0;
    return foo(x);
}
        
