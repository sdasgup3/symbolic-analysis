#include"klee.h"
struct S {
  int a; int b; int c; int d;
};

int foo(int x) {
  struct S st1;
  struct S st2;
  struct S st3;
  struct S st4;
  int *ptr;

  if (x > 100) {
    ptr = &st1.a;
    if(x < 150) {
      ptr = &st2.a; 
    }
  }
  else {
    ptr = &st3.b;
    if(x > 50) {
      ptr = &st4.b;
    }
  }
   
  return *ptr;
}


int main() {
  int x;

  klee_make_symbolic(&x, sizeof(x), "x");

  return foo(x);
}

