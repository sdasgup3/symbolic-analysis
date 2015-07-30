#include"klee.h"
#include <stdio.h>

   typedef struct {
         int x;
         int y;
           }stType;

  stType z[10];

int foo(int x) {
    if(z[0].x == 1) {
      x ++;
    }  else {
      x--;
    }
    
  return x + (z[3].x);
}


int main(int argc, char** argv) {
  int x = 0;
    return foo(x);
}
        
