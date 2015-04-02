#include"klee.h"
#include<assert.h>
#include<stdlib.h>


int main() {
  int x = 3 , y = 5;
  int*  p = (int *)malloc(sizeof(int));

  klee_make_symbolic(&x, sizeof(x), "x");
  klee_make_symbolic(&y, sizeof(y), "y");

  if(0 != x*y) {
    p = (int *)malloc(4);
  } else {
    if(y == 0) {
      p = (int *)malloc(4);
    }
  }

  if(0 == p) {
    assert(0);
  }


  return *p;
}
