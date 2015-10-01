#include "klee.h"
#include <stdlib.h>

struct S {
  int a;
  int b;
};

int foo(int x) {
  struct S st1;
  struct S st2;
  int *ptr;

  st1.a = 1;
  st1.b = 2;
  st2.a = 3;
  st2.b = 4;



  if (x > 100) {
    ptr = &st1.a;
  }
  else {
    ptr = &st2.b;
  }

  return *ptr;
}


int main() {
  int x = 10;

  int *ptr = (int *) malloc(10*sizeof(int));
  klee_make_symbolic(ptr, 10*sizeof(x), "sym_p");

  return foo(ptr[1]);
}

