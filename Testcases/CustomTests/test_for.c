#include"klee.h"
#include<stdio.h>

int main() {
  int i , N=10, sum = 0 ;

  klee_make_symbolic(&i, sizeof(i), "i");
  klee_assume(i > -1);

  for( ; i< N; i++)  {
    //printf ("In For (i,N) = (%d %d)\n",i, N);
    printf ("In For ");
    //sum += i;
  }
    printf ("Out For ");
  

  return i;
}
