#include <stdlib.h>
#include "klee.h"


int foo(int x, int a, int b, int c) {
  int *ptr;
  int* array[3] ;

  array[0] = &a;
  array[1] = &b;
  array[2] = &c;

  ptr = array[x];
   
  return *ptr;
}


int main() {
  int x=1;
  int a,b,c;
  klee_make_symbolic(&x, sizeof(x), "X");
  

  return foo(x,a,b,c);
}

