#include"klee.h"
#include<assert.h>
#include<stdlib.h>

//If you simply make pointer P symbolic, that's exactly the same as a normal variable, i.e., klee_make_symbolic(&P, sizeof(P), "p"), which means that P's value is uncertain.
//However if you also need to deference it(in most of the cases you do), you've to make the pointed area symbolic rather than P itself;

int main(int argc, char** argv) {
  int x = 3 , y = 5, sum = 0 ;
  int*  p = (int *)malloc(sizeof(int));

  klee_make_symbolic(p, sizeof(int), "p");



  if(0 != *p) {
    sum  = 0;
  } else {
    sum  =1;
  }

  return sum + *p;
  //return sum ;
}
