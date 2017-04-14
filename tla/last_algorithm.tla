--------------------------- MODULE last_algorithm ---------------------------
EXTENDS TLC, Naturals
CONSTANTS x
(*
--algorithm  last_algorithm {
variables a,b,c,i,r,fin, v; 
{
     v := x;
     a := 1;
     b := 1;
     i := 1;
     
     if (v = 0) {
        r := 1;
     };
     else {
        if (v = 1) {
            r := 1;
        };
        else {
            while(i-1 < v) {
                i := i+1;
                c := a;
                a := b;
                b := 2 * c + 2 * b;
            };
        };
        r := b; 
     }
}

}
*)

=============================================================================
\* Modification History
\* Last modified Fri Apr 14 15:34:30 CEST 2017 by quentin
\* Created Fri Apr 14 15:28:38 CEST 2017 by quentin
