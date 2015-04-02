#include"klee.h"
int plus(int first){

                  if(first+2 == 4)return 1;

                  return 0;
}


int main(int argc, char *argv[]){

                   int x;
                   klee_make_symbolic(&x, sizeof(x), "X" );
                   return plus(x);
}
