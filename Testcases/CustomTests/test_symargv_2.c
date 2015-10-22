#include <stdio.h>
#include<unistd.h>
/*
 * klee --zest --use-symbex=2 --symbex-for=10 --search=zest --zest-search-heuristic=br --zest-discard-far-states=false --posix-runtime --debug-print-aachecks ./test_symargv_2.bc A --sym-files 1 10
 */

int main(int argc, char * argv[]) {
  char buf[2];
  int i = 1;

  FILE* fp = fopen(argv[1], "r");
  read(fp, buf, 2);



  if(buf[0] == 0 ) {
    buf[1] = 's';
  } else {
    buf[1] = 'e';
  }
  return 0;
}
