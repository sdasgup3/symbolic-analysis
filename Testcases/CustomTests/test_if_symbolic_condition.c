#include"klee.h"

int main() {
  int i = 3, N, sum = 0 ;

  klee_make_symbolic(&N, sizeof(N), "N");
  klee_assume(N > 1 & N < 10);

  if(i > N) {
    sum  = 0;
  } else {
    sum  = 1;
  }

  return sum;
}
