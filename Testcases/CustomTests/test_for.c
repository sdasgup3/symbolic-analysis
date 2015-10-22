#include"klee.h"
#include<stdio.h>

int main() {
  int i , N=10, sum = 0 ;

  klee_make_symbolic(&i, sizeof(i), "i");
  klee_assume(i > -1);

  for( ; i< N; i++)  {
    sum += i;
  }
  

  return i;
}
