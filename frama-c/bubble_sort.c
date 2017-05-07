#include <stdio.h>
#include <limits.h>


/*@ ensures \result == 0;
*/
int main() {
  int array[100], n, c, d, swap;

  printf("Enter number of elements\n");
  scanf("%d", &n);
  //@ assert INT_MIN <= n <= INT_MAX;

  printf("Enter %d integers\n", n);

  /*@ loop invariant INT_MIN <= c <= INT_MAX;
      loop variant n - c;
   */
  for (c = 0; c < n; c++) {
    scanf("%d", &array[c]);
  }

  for (c = 0; c < (n-1); c++) {
    //@ assert c < n - 1;
    for (d = 0; d < n-c-1; d++) {
      //@ assert d < n - c - 1;
      if (array[d] > array[d+1]) {
        swap = array[d];
        //@ assert swap == array[d];
        array[d] = array[d+1];
        //@ assert array[d] == array[d + 1];
        array[d+1] = swap;
        //@ assert array[d + 1] == swap;
        //@ assert array[d] < array[d + 1];
      }
      //@ assert array[d] <= array[ d+ 1];
    }
    //@ assert d == n - c - 1;
  }
  //@ assert c == n - 1;


  printf("Sorted list in ascending order:\n");
  /*@ loop invariant \forall integer k; 1 <= k < n ==> array[k] > array[k - 1]; */
  for (c = 0; c < n; c++) {
    printf("%d\n", array[c]);
  }

  return 0;
}
