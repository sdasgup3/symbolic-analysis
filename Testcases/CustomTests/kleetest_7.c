#include"klee.h"
#include <stdlib.h>
#include <stdio.h>

int foo(int x, int x1, int x2, int x3, int x4) {
  int **ptr;
  int **array = (int **) malloc(4*sizeof(int *));
  int *temp;

  array[0] = &x1;
  array[1] = &x2;
  array[2] = &x3;
  array[3] = &x4;

  ptr = array + x;

   return **ptr;
  //temp =  *ptr;
  //return *temp;
}


int main() {
  int x;

  klee_make_symbolic(&x, sizeof(x), "x");
  klee_assume((x >  -1) & (x <  4));

  return foo(x,100,200,300,400);
}

