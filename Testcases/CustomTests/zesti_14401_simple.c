#include"klee.h"
#include<stdlib.h>


struct S {
  int x, y; 
};


int main(int argc, char** argv) {

  int i, x, S;
  x= 0 ;
  struct S* z;
struct S data[] =
  {
    { 1,2 },
    { 3,4 },
  };
  //struct S *data = ( struct S *) malloc(2*sizeof( struct S));
  
  klee_make_symbolic(&x, sizeof(x), "X");
 //klee_assume(x >= 0 &  x <= 1 );

  for(i = 0 ; i < 1 ; i ++) {
    z   = &data[x++];
    //z   = &data[2];
    S = z->x ; 
  }

  return 0;
}
/*
 *
 *(Ult (Mul w64 8
              (SExt w64 (ReadLSB w32 0 X))) 13)
 *
 */
