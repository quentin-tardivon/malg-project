## [La doc de génie !](https://frama-c.com/acsl_tutorial_index.html)

# Frama-c

    # inclut le plugin 'weakness precondition'
    frama-c-gui -wp exo1.c

    # La fonction appelante doit garantir toutes les preconditions à l'appel de la fonction en question
    @ requires PRECONDITION

    # La fonction appelante doit garantir toutes les postscondtions à l'appel de la fonction en question
    @ ensures POSTCONDITION

    # Lorsque que l'on travaille sur X (affectation)
    @ assigns

    # fait reférence à la valeur de x à l'appel
    \old(x)

    # fait reférence à la valeur du résultat de l'appel
    \result


    /* @requires \valid(p);
     * @ assigns *p
     * @ ensures *p == \old(*p) + 1;
    @*/
    void increment(int *p);


    /* @requires P;
    @ behavior B1;
    @   assumes   A1;
    @   requires  R1;
    @   assigns   L1;
    @   ensures   E1;
    @ behavior B2;
    @   assumes   A2;
    @   requires  R2;
    @   assigns   L2;
    @   ensures   E1;


Suivant le système, si x = INT_MIN, alors -x n'est pas codable => overflow

Pour résoudre ce problème, on inclut cette librairie:
    #include <limits.h>
    /* @ requires x > INT_MIN
     * @ requires x >= 0
     * @ requires x < INT_MAX
    */
    int f(int x) {
      x = x + 1;
    }

    ...

    frama-c -wp -wp-rte --report --wp--print pgm.c
