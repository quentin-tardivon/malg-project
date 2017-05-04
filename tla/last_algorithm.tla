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
\* BEGIN TRANSLATION
CONSTANT defaultInitValue
VARIABLES a, b, c, i, r, fin, v, pc

vars == << a, b, c, i, r, fin, v, pc >>

Init == (* Global variables *)
        /\ a = defaultInitValue
        /\ b = defaultInitValue
        /\ c = defaultInitValue
        /\ i = defaultInitValue
        /\ r = defaultInitValue
        /\ fin = defaultInitValue
        /\ v = defaultInitValue
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ v' = x
         /\ a' = 1
         /\ b' = 1
         /\ i' = 1
         /\ IF v' = 0
               THEN /\ r' = 1
                    /\ pc' = "Done"
               ELSE /\ IF v' = 1
                          THEN /\ r' = 1
                               /\ pc' = "Lbl_3"
                          ELSE /\ pc' = "Lbl_2"
                               /\ r' = r
         /\ UNCHANGED << c, fin >>

Lbl_3 == /\ pc = "Lbl_3"
         /\ r' = b
         /\ pc' = "Done"
         /\ UNCHANGED << a, b, c, i, fin, v >>

Lbl_2 == /\ pc = "Lbl_2"
         /\ IF i-1 < v
               THEN /\ i' = i+1
                    /\ c' = a
                    /\ a' = b
                    /\ b' = 2 * c' + 2 * b
                    /\ pc' = "Lbl_2"
               ELSE /\ pc' = "Lbl_3"
                    /\ UNCHANGED << a, b, c, i >>
         /\ UNCHANGED << r, fin, v >>

Next == Lbl_1 \/ Lbl_3 \/ Lbl_2
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION

=============================================================================
\* Modification History
\* Last modified Thu May 04 10:08:09 CEST 2017 by quentin
\* Created Fri Apr 14 15:28:38 CEST 2017 by quentin
