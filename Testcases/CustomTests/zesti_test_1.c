#include "klee.h"

int v [100];
void func(int x)
{
  if(x > 99) {
    x = 99;
  }
  v[x] = 0 ;
}

int main()
{

  int x = 100; // have to apply --use-symbex=1
  int y;
  //int x = 99;  // can skip it as the error in in the concreate path; but in case u add this
               // (--use-symbex=1) then the other path to v[x] = 0 will also et explored
  klee_make_symbolic(&x, sizeof(x), "x");

  func(x);

}
