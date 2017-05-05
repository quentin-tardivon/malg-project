#include <stdio.h>
#include <limits.h>

/*
 - On check si n est bien un integer valide
 - on verifie que aucune variable exterieur, ni arguments soit modifiés par la méthode (revient à faire
 ensures n == \old(n))
 - Si n negatif ou nul
        - le résultat est 1
 - Si n positif
        - le résultat est (((n*(n+1)/2)+1)
*/

/* @ requires n > INT_MIN;
 * @ requires n >= 0;
 * @ requires n < INT_MAX;
 * @ assigns \nothing
 * @ requires n >= 0;
 * @ behavior n_negative_nul:
        assumes n <= 0;
        ensures \result == 1;
 * @ behavior n_pos:
        assumes n > 0;
        ensures \result == (((n*(n+1)/2)+1);
*/
int pink_floyd(int n) {
  int i, c, a = 1;
  //@ assert a == 1;

  for (i = 1; i <= n; i++) {
    //@ assert i <= n;
    for (c = 1; c <= i; c++) {
      //@ assert c <= i;
      printf("%d ",a);
      a++;
    }
    printf("\n");
  }
  return a;
}

int main() {
  int n;
  printf("Enter the number of rows of Floyd's triangle to print\n");
  scanf("%d", &n);
  pink_floyd(n);
  return 0;
}
