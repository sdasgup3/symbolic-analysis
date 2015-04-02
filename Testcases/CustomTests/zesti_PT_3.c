#include"klee.h"
#include<assert.h>
#include<stdlib.h>


int main() {
  int x=1 , y=2;
  int*  p = (int *)malloc(sizeof(int));

  klee_make_symbolic(&x, sizeof(x), "x");
  klee_make_symbolic(&y, sizeof(y), "y");

  if(0 != x*y) {
    p = (int *)malloc(4);
  } else {
    if(y == 0) {
      if(x == 3) {
        p = (int *)malloc(4); //-1
      } else {
        p = (int *)malloc(4);
      }
    }
  }

  return *p;
}
