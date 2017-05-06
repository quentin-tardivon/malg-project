#include <stdio.h>


/*@ assigns \nothing;
  behavior x_eq_zero:
      assumes x == 0;
      ensures \result == 1;
    behavior x_eq_one:
      assumes x == 1;
      ensures \result == 1;
    behavior x_eq_other:
      assumes x != 0 && x != 1;
      ensures 1 == 1;
*/
int p1(int x) {
  int a,b,c,i,r,fin;
  a = 1;
  //@ assert a == 1;
  b = 1;
  //@ assert b == 1;
  i = 2;
  //@ assert i == 2;

  if(x == 0) {
    //@ assert x == 0;
    r = 1;
    //@ assert r == 1;
  }
  else {
    //@ assert x != 0;
    if (x ==1 ) {
      r = 1;
      //@ assert r == 1 && x == 1;
    }
    else {
      while (i-1 < x) {
        i = i+1;
        c = a;
        //@ assert c == a;
        a = b;
        //@ assert b == a;
        b = 2*c+2*b;
      }
    }
    r = b;
    //@ assert r == b;
  }
  return (r);
}

/*@
  ensures \result == 0;
  */
int main() {
  int v;
  printf("Entrer la valeur pour v\n");
  scanf("%d", &v);
  printf("Voici la réponse de votre solution p1(%d)=%d\n", v, p1(v));
  return 0;
}
