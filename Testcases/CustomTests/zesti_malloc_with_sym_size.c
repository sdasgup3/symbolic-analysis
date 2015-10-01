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
//For now we just pick a size. Ideally we would support
    // symbolic sizes fully but even if we don't it would be better to
    // "smartly" pick a value, for example we could fork and pick the
    // min and max values and perhaps some intermediate (reasonable
    // value).

  klee_make_symbolic(&x, sizeof(x), "sym_x");

  int *ptr = (int *) malloc(x*sizeof(int));

  return foo(ptr[1]);
}

