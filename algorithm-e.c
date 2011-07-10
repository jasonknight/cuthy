#include <stdio.h>
#include <stdlib.h>
void help();
void banner();
int main(int argc, char * argv[]) {
  int m,n,r;
  if (argc < 3) {
    help();
    return 0;
  }
  banner();
  m = atoi(argv[1]);
  n = atoi(argv[2]);
  if (m < n) {
    int tn = n;
    n = m;
    m = tn;
  }
  printf("Finding the greatest common denominator for %d and %d\n",m,n);
  r = m % n;
  while (r != 0) {
    m = n;
    n = r;
    r = m % n;
  }
  printf("The greatest common denominator is %d\n",n);
}
void help() {
  printf("\nUsage: ./program-e.bin int int\n");
}
void banner() {
  printf("Algorithm E (Euclid's algorithm) Page 2 1.1\n");
}
