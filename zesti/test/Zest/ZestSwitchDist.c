// RUN: %llvmgcc -emit-llvm -c -g -o %t1.bc %s
// RUN: %klee --zest --output-level=error --use-symbex=1 --symbex-for=5 --emit-all-errors --search=zest %t1.bc z
// RUN: ls klee-last/ | grep .ptr.err | wc -l | grep 3
// RUN: grep "Current searcherdistance 0" klee-last/test000001.ptr.err 
// RUN: grep "Current searcherdistance 0" klee-last/test000002.ptr.err 
// RUN: grep "Current searcherdistance 0" klee-last/test000003.ptr.err 

#include <stdio.h>

int main(int argc, char** argv) {
  int a[10] = {0};

  char opt = argv[1][0];

  int index = 9;

#if 1
  switch (opt) {
  case 'a':
    index += 1;
  case 'b':
    index += 2;
  case 'c':
    index += 3;
  }
#endif

  return a[index];
}
