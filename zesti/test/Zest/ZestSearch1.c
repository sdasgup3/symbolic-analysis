// RUN: %llvmgcc -emit-llvm -c -g -o %t1.bc %s
// RUN: %klee --zest --use-symbex=1 --search=zest %t1.bc z
// RUN: ls klee-last/ | grep .ptr.err | wc -l | grep 1
// RUN: %klee --zest --use-symbex=1 --search=zest %t1.bc b
// RUN: ls klee-last/ | grep .ptr.err | wc -l | grep 1

#include <stdio.h>

int main(int argc, char** argv) {
  int a[10] = {0};
  
  char opt = argv[1][0];
  
  int index = 7;

  klee_make_symbolic(&index, sizeof(index), "index");
  klee_assume(index == 7);

  if (opt == 'c')
    index += 3;

  if (opt == 'b')
    index += 2;

  if (opt == 'a')
    index++;
  
  return a[index];
}
