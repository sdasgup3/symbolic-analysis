#include"klee.h"
#include <stdlib.h>

   typedef struct {
         int x;
         int y;
           }stType;

  stType* z[2];

int foo(int x) {
    if(z[0]->x == 1) {
      x ++;
    }  else {
      x--;
    }
    
  return x + (z[1]->x);
}


int main(int argc, char** argv) {
  int x = 0;
  z[0] = (stType *) malloc(sizeof(stType));
  z[1] = (stType *) malloc(sizeof(stType));

    return foo(x);
}
        
