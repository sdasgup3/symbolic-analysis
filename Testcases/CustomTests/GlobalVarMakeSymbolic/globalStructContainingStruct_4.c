#include"klee.h"
#include <stdio.h>

   typedef struct {
         int x;
         int y[10];
           }ptType;

   typedef struct {
         int x;
         ptType y;
           }stType;

  stType z;

int foo(int x) {
    if(z.y.y[2] == 0) {
      x ++;
    }  else {
      x--;
    }
    
  return x + (z.y.x);
}


int main(int argc, char** argv) {
  int x = 0;
    return foo(x);
}
        
