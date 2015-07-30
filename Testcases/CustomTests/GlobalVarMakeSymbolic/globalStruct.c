#include"klee.h"
#include <stdio.h>

  int x;
   typedef struct {
         int x;
         int y;
           }stType;

  stType z;

int foo(int x, void *p) {
  if(x < 1) {
    x= 0 ;
  } else {
    x = 1;
    if(z.y == 0) {
      x ++;
    }  else {
      x--;
    }
  }
  return x;
}


int main(int argc, char** argv) {
    return foo(x, &x);
}
        
