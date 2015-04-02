#include"klee.h"
#include<assert.h>
#include<stdlib.h>


int main() {
  int x=1 , y=2;
  int  p = 10;

  klee_make_symbolic(&x, sizeof(x), "x");
  klee_make_symbolic(&y, sizeof(y), "y");

  if(0 != x*y) {
    p = 4;
  } else {
    if(y == 0) {
      p = 5;
    }
  }


  return p;
}
