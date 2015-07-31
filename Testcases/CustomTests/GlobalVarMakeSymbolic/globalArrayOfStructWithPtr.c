#include"klee.h"
#include <stdio.h>

   typedef struct {
         int x;
         int *y;
           }stType;

  stType z[10];

int foo(int x) {
    if(z[0].x == 1) {
      x ++;
    }  else {
      x--;
    }
    
  return x + (*z[3].y);
}


int main(int argc, char** argv) {
  int x = 0;
  z[3].y = (int *) malloc(sizeof(int));
    return foo(x);
}
        
