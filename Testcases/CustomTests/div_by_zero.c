#include "klee.h"
#include "assert.h"

int func(int x, int y)
{
  return y/x;
}

int main()
{

  int x,y=10;


  klee_make_symbolic(&x, sizeof(x), "x");

  func(x,y);

}
