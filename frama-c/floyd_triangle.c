#include <stdio.h>
#include <limits.h>

/*@ ensures \result == 0;
    assigns \nothing;
*/
int main() {
  int n, i, c, a = 1;
  printf("Enter the number of rows of Floyd's triangle to print\n");
  scanf("%d", &n);
  //@ assert INT_MIN <= n <= INT_MAX;
  //@ assert a == 1;

  /*@ loop invariant c <= n + 1;
      loop assigns i;
      loop variant n - i;
   */
  for (i = 1; i <= n; i++) {
    //@ assert i <= n + 1;
    /*@ loop invariant c <= i + 1;
        loop assigns c, a;
        loop variant i - c;
     */
    for (c = 1; c <= i; c++) {
      //@ assert c <= i;
      printf("%d ",a);
      a++;
    }
    //@ assert c > i;
    printf("\n");
  }
  //@ assert i > n;
  //@ assert a == ((n*(n + 1) / 2) + 1);
  return 0;
}
