#include"klee.h"
#include <stdlib.h>

int* p;

int foo(int x, int *p) {
    if(p == 0) {
      x ++;
    }  else {
      x--;
    }
    
  return x + *(p);
}


int main(int argc, char** argv) {
  int x = 0;
  klee_make_symbolic(&p, sizeof(p), "");
  p = (int *)malloc(sizeof(int));
    return foo(x,p);
}
        
