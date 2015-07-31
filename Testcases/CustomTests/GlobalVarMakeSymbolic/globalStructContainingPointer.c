#include"klee.h"
#include <stdlib.h>

   typedef struct {
         int x;
         int *y;
           }stType;

  stType z;

int foo(int x) {
    if(z.x == 0) {
      x ++;
    }  else {
      x--;
    }
    
  return x + *(z.y);
}


int main(int argc, char** argv) {
  int x = 0;
  z.y = (int *) malloc(sizeof(int));
    return foo(x);
}
        
