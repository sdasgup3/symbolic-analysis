#include"klee.h"

int main() {
  int i, N, sum = 0 ;

  klee_make_symbolic(&N, sizeof(N), "N");
  klee_assume(N > 1 & N < 10);

    if(N%2 == 0 ) {
      sum += N;
    } else if(N%3 == 0) {
      sum += N;
    }

  return sum;
}
