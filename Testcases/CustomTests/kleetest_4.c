#include"klee.h"
#include <stdlib.h>

int foo(int x, int y, int w) {
  int * array[2];
  array[0] = &y;
  array[1] = &w;

  int **ptr;
  ptr = array + x;
   
  int *temp =  *ptr;
  return *temp;
}


int main() {
  int x, y = 0, w = 0;

  klee_make_symbolic(&x, sizeof(x), "x");
  klee_assume(x >= 0);
  klee_assume( x <= 4);

  return foo(x, y, w);
}

