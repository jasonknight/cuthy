#include <stdio.h>
#include <stdlib.h>
void help();
void banner();
void primes(int num);
void print_table(const int * prime_table, const int num);
int main(int argc, char * argv[]) {
  int num;
  if (argc < 2) {
    help();
    return 0;
  }
  banner();
  num = atoi(argv[1]);
  primes(num);
}
void help() {
  printf("\nUsage: ./program-p.bin int\n");
}
void banner() {
  printf("Algorithm P (Calculate Primes) Page 147 1.3.2\n");
}
void primes(int num) {
  int * prime_table = (int *)malloc(num * sizeof(int));
  int n,j,k,q,r;
  init:
    prime_table[1] = 2;
    n = 3;
    j = 1;
  n_is_prime:
    j = j + 1;
    prime_table[j] = n;
  total_found:
    if (j == num -1) {
      print_table(prime_table, num);
      return;
    }
  advance_n:
    n = n + 2;
    k = 2;
  divide_n:
    q = n / prime_table[k];
    r = n % prime_table[k];
    if (r == 0) {
      goto advance_n;
    }
    if (q <= prime_table[k]) {
      goto n_is_prime;
    }
    k++;
    goto divide_n;
}
void print_table(const int * prime_table, const int num) {
  printf("-----+ The first %d Primes +-----\n", num);
  int head = 1;
  short thr = 9;
  short j = 0;
  while (head < num) {
    printf("\t%d",prime_table[head]);
    head++;
    if (j == thr) {
      printf("\n");
      j = 0;
    } else {
      j++;
    }

  }
  printf("\n");
}
