#include "klee.h"

int v [100];
void func(int x)
{
  int y=0;
  if(x > 99) {
    y = 99;
  } else {  //without the else path no error is trigered, because the memory access index is always concrete and within bounds.
    y = -1;
  }
  v[y] = 0 ;
}

int main()
{

  int x = 99;  
  klee_make_symbolic(&x, sizeof(x), "x");

  func(x);

}
