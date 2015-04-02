#include <stdio.h>
#include "klee.h"

int main(int cArgs, char* args[])
{
                int n;
                int j;

                klee_make_symbolic(&n, sizeof(int), "n");
                klee_make_symbolic(&j, sizeof(int), "j");

                n = printf("Value: %d",j);

                if(n>50)
                {
                                printf("big\n");
                }
                else
                {
                                printf("small\n");
                }
}
