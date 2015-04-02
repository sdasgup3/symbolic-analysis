#include"klee.h"
#include <stdlib.h>

int foo(unsigned x, int y, int w, int z) {
  int ** array = (int *)malloc(3*sizeof(int));
  array[0] = &y;
  array[1] = &w;
  array[2] = &z;

  int **ptr;
  ptr = array + x;
   
  int *temp = *ptr;
  int p =  *temp;
  return x;
}


int main() {
  int x; 
  int y = 0, w = 0, z = 0;

  klee_make_symbolic(&x, sizeof(x), "x");
  klee_assume((x < 3) & (x > -1));

  return foo(x, y, w, z);
}

