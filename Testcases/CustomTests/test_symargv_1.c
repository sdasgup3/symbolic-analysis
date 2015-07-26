#include <stdio.h>
#include <string.h>
/*
 * klee --zest --use-symbex=2 --symbex-for=10 --search=zest --zest-search-heuristic=br --zest-discard-far-states=false --debug-print-aachecks --posix-runtime ./test_symargv_1.bc -sym-args 100 100 1
 */

int main(int argc, char * argv[]) {
  char buf[10];
  int i = 1;

  printf("%s", argv[1]);


  if(argv[100][0] == 'l') {
    strcpy(buf, argv[1]);
  } else {
    buf[i] = 'l';
  }
  return 0;
}
