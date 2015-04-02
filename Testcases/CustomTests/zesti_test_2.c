#include "klee.h"
#include "assert.h"

int v [100];
void func(int x)
{
  if(x > 99) {
    if(x > 199) 
      return;
    x = 99;
  }
  v[x] = 0 ;
}

int main()
{

  //int x = 0; // --use-symbex=0
  //int x = 150; // --use-symbex=1; nothing for 0
  int x = 200; // cannot detect any sens during concrete run; so even if we set any depth the search heuristics to not abole to reach any.
  klee_make_symbolic(&x, sizeof(x), "x");

  func(x);

}
