---------------------------- MODULE bubble_sort ----------------------------
EXTENDS TLC, Naturals
CONSTANTS n, min, max
array0 == [k \in 0..n-1 |-> 
                        IF k=0 THEN 3
                        ELSE IF k=1 THEN 12
                        ELSE IF k=2 THEN 4
                        ELSE 6]

(*
--algorithm bubble_sort {
variables array, c, d, swap;
{
     p1: array:=array0;
     p2: c:=0;
     p3: while(c < n)
        {
               p4: d:= 0;
               p5: while ( d <  (n - c - 1))
                {
                        p6: if (array[d] > array[d+1])
                        {
                                p7: swap := array[d];
                                p8: array[d] := array[d+1];
                                p9: array[d+1] := swap;
                        };
                        p10: d:=d+1;
                };
                p11: c:=c+1;
        }
}

}
*)
\* BEGIN TRANSLATION
CONSTANT defaultInitValue
VARIABLES array, c, d, swap, pc

vars == << array, c, d, swap, pc >>

Init == (* Global variables *)
        /\ array = defaultInitValue
        /\ c = defaultInitValue
        /\ d = defaultInitValue
        /\ swap = defaultInitValue
        /\ pc = "p1"

p1 == /\ pc = "p1"
      /\ array' = array0
      /\ pc' = "p2"
      /\ UNCHANGED << c, d, swap >>

p2 == /\ pc = "p2"
      /\ c' = 0
      /\ pc' = "p3"
      /\ UNCHANGED << array, d, swap >>

p3 == /\ pc = "p3"
      /\ IF c < n
            THEN /\ pc' = "p4"
            ELSE /\ pc' = "Done"
      /\ UNCHANGED << array, c, d, swap >>

p4 == /\ pc = "p4"
      /\ d' = 0
      /\ pc' = "p5"
      /\ UNCHANGED << array, c, swap >>

p5 == /\ pc = "p5"
      /\ IF d <  (n - c - 1)
            THEN /\ pc' = "p6"
            ELSE /\ pc' = "p11"
      /\ UNCHANGED << array, c, d, swap >>

p6 == /\ pc = "p6"
      /\ IF array[d] > array[d+1]
            THEN /\ pc' = "p7"
            ELSE /\ pc' = "p10"
      /\ UNCHANGED << array, c, d, swap >>

p7 == /\ pc = "p7"
      /\ swap' = array[d]
      /\ pc' = "p8"
      /\ UNCHANGED << array, c, d >>

p8 == /\ pc = "p8"
      /\ array' = [array EXCEPT ![d] = array[d+1]]
      /\ pc' = "p9"
      /\ UNCHANGED << c, d, swap >>

p9 == /\ pc = "p9"
      /\ array' = [array EXCEPT ![d+1] = swap]
      /\ pc' = "p10"
      /\ UNCHANGED << c, d, swap >>

p10 == /\ pc = "p10"
       /\ d' = d+1
       /\ pc' = "p5"
       /\ UNCHANGED << array, c, swap >>

p11 == /\ pc = "p11"
       /\ c' = c+1
       /\ pc' = "p3"
       /\ UNCHANGED << array, d, swap >>

Next == p1 \/ p2 \/ p3 \/ p4 \/ p5 \/ p6 \/ p7 \/ p8 \/ p9 \/ p10 \/ p11
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION

IsSorted(A) == \A j, k \in 0..n-1 : (j =< k) => (A[j] =< A[k])

Prec1 == pc="p4" => c < n

Prec2 == pc="p6" => d <  (n - c - 1)

Prec3 == pc = "p7" => array[d] > array[d+1]

Correctness == pc = "Done" => IsSorted(array)

Overflow == n \in min..max /\ c \in min..max /\ d \in min..max /\ swap \in min..max


=============================================================================
\* Modification History
\* Last modified Sun May 07 11:09:05 CEST 2017 by quentin
\* Created Fri Apr 14 15:19:58 CEST 2017 by quentin
