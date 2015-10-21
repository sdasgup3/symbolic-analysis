#include"klee.h"
#include<stdio.h>

int main(int argc, char** argv ) {
  int i = 3 , N, sum = 0 ;

  klee_make_symbolic(&N, sizeof(N), "N");
  klee_assume(N > 1 & N < 10);
  //klee_assume(N > 1);

  for(i=  3 ; i< N; i++)  {
    sum += i; 
  }

  return sum;
}
