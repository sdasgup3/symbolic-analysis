#include"klee.h"
#include<stdlib.h>


struct S {
  int x, y, z; 
};


int main(int argc, char** argv) {

  int i, x, S;
  x= 0 ;
  struct S* z;
  klee_make_symbolic(&x, sizeof(x), "X");
  //klee_assume(x >= 0 &  x <= 4 );
  //klee_assume(x == 0);



  struct S **data = ( struct S **) malloc(5*sizeof( struct S *));
  for(i = 0 ; i < 5; i ++) {
    data[i] = (struct S*) malloc(sizeof(struct S));
  }
  
  z = data[x];
  S = z->x ; 

  return 0;
}

/*
KLEE: DSAND: boundsCheck 
KLEE: DSAND: (Ult (Add w64 18446744073677460400
              (ReadLSB w64 N0:(Extract w32 0 (Mul w64 8
                                                      (SExt w64 (ReadLSB w32 0 X)))) const_arr1))
     5) 
     */

