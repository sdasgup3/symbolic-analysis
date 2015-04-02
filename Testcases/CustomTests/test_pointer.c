#include"klee.h"
#include<assert.h>
#include<stdlib.h>


int main() {
  int x = 3 , y = 5, sum = 0 ;
  int*  p = (int *)malloc(sizeof(int));

  klee_make_symbolic(&p, sizeof(p), "p");

  if(0 != p) {
    sum  = 0;
  } else {
    sum  =1;
  }

  return sum;
}
