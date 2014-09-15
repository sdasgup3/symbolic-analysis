// RUN: %llvmgcc -emit-llvm -c -o %t1.bc %s
// RUN: %klee --zest %t1.bc x
// RUN: test -f klee-last/test000001.div.err

#include <assert.h>
int main(int argc, char* argv[])
{
  assert(argc == 2);
  
  return 20/argv[1][0];
}

