--------------------------- MODULE floyd_triangle ---------------------------
EXTENDS TLC, Naturals
CONSTANTS n0, min, max
(*
--algorithm  floyd_triangle {
variables n,i,c,a = 1; 
{
     p1: n:= n0;
     p2: while(i <= n) {
        p3: c:=1;
         p4: while ( c <= i) {
            p5: print a;
            p6: c := c + 1;
            p7: a := a + 1;  
        };
        p8: i:=i+1;
     };
}

}
*)
\* BEGIN TRANSLATION
CONSTANT defaultInitValue
VARIABLES n, i, c, a, pc

vars == << n, i, c, a, pc >>

Init == (* Global variables *)
        /\ n = defaultInitValue
        /\ i = defaultInitValue
        /\ c = defaultInitValue
        /\ a = 1
        /\ pc = "p1"

p1 == /\ pc = "p1"
      /\ n' = n0
      /\ pc' = "p2"
      /\ UNCHANGED << i, c, a >>

p2 == /\ pc = "p2"
      /\ IF i <= n
            THEN /\ pc' = "p3"
            ELSE /\ pc' = "Done"
      /\ UNCHANGED << n, i, c, a >>

p3 == /\ pc = "p3"
      /\ c' = 1
      /\ pc' = "p4"
      /\ UNCHANGED << n, i, a >>

p4 == /\ pc = "p4"
      /\ IF c <= i
            THEN /\ pc' = "p5"
            ELSE /\ pc' = "p8"
      /\ UNCHANGED << n, i, c, a >>

p5 == /\ pc = "p5"
      /\ a' = a + 1
      /\ pc' = "p6"
      /\ UNCHANGED << n, i, c >>

p6 == /\ pc = "p6"
      /\ c' = c + 1
      /\ pc' = "p7"
      /\ UNCHANGED << n, i, a >>

p7 == /\ pc = "p7"
      /\ PrintT(a)
      /\ pc' = "p4"
      /\ UNCHANGED << n, i, c, a >>

p8 == /\ pc = "p8"
      /\ i' = i+1
      /\ pc' = "p2"
      /\ UNCHANGED << n, c, a >>

Next == p1 \/ p2 \/ p3 \/ p4 \/ p5 \/ p6 \/ p7 \/ p8
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION



Q1 == (pc="Lbl_2" /\ i <= n) => c <= i + 1

Q2 == pc = "Lbl_2" \/ pc = "Lbl_3" => n = n0

Q3 == (pc = "Lbl_2" /\ i <= n) => pc' = "Lbl_3"

Q4 == pc = "Done" => pc="Done"

Q5 == pc = "Done" => a = (((n*(n+1))\div2)+1)

correction == a \in min..max \* Condition de sureté




=============================================================================
\* Modification History
\* Last modified Wed May 03 11:54:11 CEST 2017 by quentin
\* Created Fri Apr 14 15:08:52 CEST 2017 by quentin
