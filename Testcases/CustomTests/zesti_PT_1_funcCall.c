#include"klee.h"
#include<assert.h>
#include<stdlib.h>


int func(int x, int y) {

  int*  p = (int *)malloc(sizeof(int));
  if(0 != x*y) {
    p = (int *)malloc(4);
  } else {
    if(y == 0) {
      p = (int *)malloc(4); // -1
    }
  }


  return *p;
}

int main(int argc, char** argv) {
  int x=1 , y=2;

  klee_make_symbolic(&x, sizeof(x), "x");
    klee_make_symbolic(&y, sizeof(y), "y");

 return   func(x,y);
}
