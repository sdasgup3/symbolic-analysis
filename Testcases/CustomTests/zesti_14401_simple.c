#include"klee.h"


struct S {
  int x, y; 
};

struct S data[] =
  {
    { 1,2 },
    { 3,4 },
  };

int main(int argc, char** argv) {

  int i, x, S;
  x= 0 ;
  struct S* z;

  klee_make_symbolic(&x, sizeof(x), "X");
 klee_assume(x >= 0 &  x <= 1 );

  for(i = 0 ; i < 1 ; i ++) {
    z   = &data[x++];
    S = z->x ; 
  }

  return 0;
}
