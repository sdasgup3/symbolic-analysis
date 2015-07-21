#include"klee.h"
#include<assert.h>
#include<stdlib.h>


int main(int argc, char** argv) {
  int x = 3 , y = 5, sum = 0 ;
  int index = 1;	


  klee_make_symbolic(&index, sizeof(index), "sym_index");
  int*  p = (int *)malloc(index * sizeof(int));




  if(0 != p) {
    sum  = 0;
  } else {
    sum  =1;
  }

 return sum + *p;
  //return sum ;
}
