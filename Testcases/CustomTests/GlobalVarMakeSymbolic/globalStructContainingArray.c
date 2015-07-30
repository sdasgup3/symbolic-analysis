#include"klee.h"
#include <stdio.h>

   typedef struct {
         int x;
         int y[10];
           }stType;

  stType z;

int foo(int x) {
    if(z.y[3] == 0) {
      x ++;
    }  else {
      x--;
    }
    
  return x ;
}


int main(int argc, char** argv) {
  int x = 0;
    return foo(x);
}
        
