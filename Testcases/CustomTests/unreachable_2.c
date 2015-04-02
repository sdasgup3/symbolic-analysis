#include "klee.h"
#include "assert.h"



 void func(int x, int y) {
        int z = 2*y;
        if (x == 100000) {
            if (x < z) {
                assert(0); /* error */
            }
        }
}


int main()
{

  int x,y;

  klee_make_symbolic(&x, sizeof(x), "x");
  klee_make_symbolic(&y, sizeof(y), "y");

  func(x,y);

}
