// RUN: %llvmgcc -emit-llvm -c -g -o %t1.bc %s
// RUN: %klee --zest --output-level=error --use-symbex=1 --symbex-for=2 --search=zest --every-access %t1.bc a
// RUN: ls klee-last/ | grep .ptr.err | wc -l | grep 2

#include <stdio.h>

int main(int argc, char** argv) {
  int a[10] = {0};

  char opt = argv[1][0];
  switch (opt) {
  case 'a':
    return 2;
  case 'b':
    return a[opt];
  default:
    return a[20];
  }
}
