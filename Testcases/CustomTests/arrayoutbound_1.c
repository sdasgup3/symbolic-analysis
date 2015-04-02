#include<stdlib.h>
#include "klee.h"


/*The results will change with the inclusion of argc argv*/
//int main(int argc, char* argv[])
int main()
{
  int my_x;
  int arr[10];
  klee_make_symbolic(&my_x, sizeof(my_x), "x");


  if(my_x > 9) {
    my_x = 9;
  }
  arr[my_x]  = 1;

  return 0;
      
}
