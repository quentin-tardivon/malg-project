--------------------------- MODULE last_algorithm ---------------------------
EXTENDS TLC, Naturals, Reals
CONSTANTS x, min, max
(*
--algorithm  last_algorithm {
variables a, b, c, i, r, fin, v; 
{
     p1: v := x;
     p2: a := 1;
     p3: b := 1;
     p4: i := 2;
     
     p5: if (v = 0) {
        p6: r := 1;
     };
     else {
        p7: if (v = 1) {
            p8: r := 1;
        };
        else {
            p9: while (i-1 < v) {
                p10: i := i+1;
                p11: c := a;
                p12: a := b;
                p13: b := 2 * c + 2 * b;
            };
        };
        p14: r := b; 
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
        /\ pc = "p1"

p1 == /\ pc = "p1"
      /\ v' = x
      /\ pc' = "p2"
      /\ UNCHANGED << a, b, c, i, r, fin >>

p2 == /\ pc = "p2"
      /\ a' = 1
      /\ pc' = "p3"
      /\ UNCHANGED << b, c, i, r, fin, v >>

p3 == /\ pc = "p3"
      /\ b' = 1
      /\ pc' = "p4"
      /\ UNCHANGED << a, c, i, r, fin, v >>

p4 == /\ pc = "p4"
      /\ i' = 1
      /\ pc' = "p5"
      /\ UNCHANGED << a, b, c, r, fin, v >>

p5 == /\ pc = "p5"
      /\ IF v = 0
            THEN /\ pc' = "p6"
            ELSE /\ pc' = "p7"
      /\ UNCHANGED << a, b, c, i, r, fin, v >>

p6 == /\ pc = "p6"
      /\ r' = 1
      /\ pc' = "Done"
      /\ UNCHANGED << a, b, c, i, fin, v >>

p7 == /\ pc = "p7"
      /\ IF v = 1
            THEN /\ pc' = "p8"
            ELSE /\ pc' = "p9"
      /\ UNCHANGED << a, b, c, i, r, fin, v >>

p8 == /\ pc = "p8"
      /\ r' = 1
      /\ pc' = "p14"
      /\ UNCHANGED << a, b, c, i, fin, v >>

p9 == /\ pc = "p9"
      /\ IF i-1 < v
            THEN /\ pc' = "p10"
            ELSE /\ pc' = "p14"
      /\ UNCHANGED << a, b, c, i, r, fin, v >>

p10 == /\ pc = "p10"
       /\ i' = i+1
       /\ pc' = "p11"
       /\ UNCHANGED << a, b, c, r, fin, v >>

p11 == /\ pc = "p11"
       /\ c' = a
       /\ pc' = "p12"
       /\ UNCHANGED << a, b, i, r, fin, v >>

p12 == /\ pc = "p12"
       /\ a' = b
       /\ pc' = "p13"
       /\ UNCHANGED << b, c, i, r, fin, v >>

p13 == /\ pc = "p13"
       /\ b' = 2 * c + 2 * b
       /\ pc' = "p9"
       /\ UNCHANGED << a, c, i, r, fin, v >>

p14 == /\ pc = "p14"
       /\ r' = b
       /\ pc' = "Done"
       /\ UNCHANGED << a, b, c, i, fin, v >>

Next == p1 \/ p2 \/ p3 \/ p4 \/ p5 \/ p6 \/ p7 \/ p8 \/ p9 \/ p10 \/ p11
           \/ p12 \/ p13 \/ p14
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION



Res == pc = "Done" /\ v = 0 => r = 1

Res2 == pc = "Done" => v = 1/2 * (1+ sqrt(3)) \pow 2 + (1 - \sqrt(3)) \pow 2

Overflow == a \in min..max /\ b \in min..max /\ c \in min..max /\ i \in min..max /\ r \in min..max /\ fin \in min..max /\ v \in min..max \* Condition de sureté



=============================================================================
\* Modification History
\* Last modified Fri May 05 15:45:33 CEST 2017 by quentin
\* Created Fri Apr 14 15:28:38 CEST 2017 by quentin
