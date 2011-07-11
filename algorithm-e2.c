#include <stdio.h>
#include <stdlib.h>
void help();
void banner();
void easter(int year);
char * get_ord(int d);
int main(int argc, char * argv[]) {
  int year;
  if (argc < 2) {
    help();
    return 0;
  }
  banner();
  year = atoi(argv[1]);
  easter(year);
}
void help() {
  printf("Usage: ./program-e.bin int year\n");
}
void banner() {
  printf("Algorithm E2 (Calculate Easter Date) Page 160 1.3.2\n");
}
void easter(int year) {
  int g,c,x,z,d,e,n;
  int day;
  char * month;
  g = (year % 19) + 1; // Golden Number of the Metonic Cycle
  c = (year / 100) + 1; // The century, when year is not * of 100
  x = ((3 * c) / 4) - 12; // Corrections for leap year
  z = ((8 * c) / 25) - 5; // Correction for the moons orbit
  d = ((5 * year) / 4) - x - 10; // Find sunday
  e = ((11 * g) + 20 + z - x) % 30; // epact
  if ( e == 25 && g > 11 )
      e++;
  n = 44 - e;
  if ( n < 21 )
      n = n + 30;
  n = n + 7 - ((d + n) % 7);
  if ( n > 31 ) {
    day = n - 31;
    month = "April";
  } else {
    day = n;
    month = "march";
  }
  printf("Easter for %d will be %d%s of %s\n",year,day,get_ord(day),month);
}
char * get_ord(int d) {
  int q,r;
  if ( d > 20 ) {
    q = d / 10;
    r = d % 10;
    if (r == 0) {
      d = q;
    } else {
      d = r;
    }
  }
  switch(d) {
    case 1:
      return "st";
      break;
    case 2:
      return "nd";
      break;
    case 3:
      return "rd";
      break;
    default:
      return "th";
      break;
  }
  return "th";
}
