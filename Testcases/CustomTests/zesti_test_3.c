#include "klee.h"
#include "assert.h"

int v [100];
void func(int x)
{
  if(x > 99) {
    if(x > 199) 
      x = 0;
    x = 99;
  }
  if(x != 200)
    v[x] = 0 ;
}

int main()
{

  int x = 200;  //  detect sens inst; but the concreat path does not
                //  initialte any error. with use-symbex>1, additional paths
                //  are explored like x = 99; if(x!= 200) ; v[x]=0 .. (no error detecte
                //  in this path as well) and like if(x != 200) ; v[x] = 0 
                //  (with condition x <= 99) (this cause the error) 
  klee_make_symbolic(&x, sizeof(x), "x");

  func(x);

}
