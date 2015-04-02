#include"klee.h"

int main() {
  int a;
  int array[] = {1,2,3,4,5};

  klee_make_symbolic(&a, sizeof(a), "a");
  klee_assume(a > -1 & a < 5);

  if(array[a] == 3)
    return 0;
  else
    return 1;
}
