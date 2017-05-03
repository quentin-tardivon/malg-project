---------------------------- MODULE bubble_sort ----------------------------
EXTENDS TLC, Naturals
CONSTANTS array0

(*
--algorithm bubble_sort {
variables array, n, c, d, swap;
{
     array:=array0;
     c:=0;
     while(c < n)
        {
                d:= 0;
                while ( d <  (n - c - 1))
                {
                        if (array[d] > array[d+1])
                        {
                                swap := array[d];
                                array[d] := array[d+1];
                                array[d+1] := swap;
                        };
                        d:=d+1;
                };
                c:=c+1;
        }
}

}
*)
\* BEGIN TRANSLATION
CONSTANT defaultInitValue
VARIABLES array, n, c, d, swap, pc

vars == << array, n, c, d, swap, pc >>

Init == (* Global variables *)
        /\ array = defaultInitValue
        /\ n = defaultInitValue
        /\ c = defaultInitValue
        /\ d = defaultInitValue
        /\ swap = defaultInitValue
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ array' = array0
         /\ c' = 0
         /\ pc' = "Lbl_2"
         /\ UNCHANGED << n, d, swap >>

Lbl_2 == /\ pc = "Lbl_2"
         /\ IF c < n
               THEN /\ d' = 0
                    /\ pc' = "Lbl_3"
               ELSE /\ pc' = "Done"
                    /\ d' = d
         /\ UNCHANGED << array, n, c, swap >>

Lbl_3 == /\ pc = "Lbl_3"
         /\ IF d <  (n - c - 1)
               THEN /\ IF array[d] > array[d+1]
                          THEN /\ swap' = array[d]
                               /\ array' = [array EXCEPT ![d] = array[d+1]]
                               /\ pc' = "Lbl_4"
                          ELSE /\ pc' = "Lbl_5"
                               /\ UNCHANGED << array, swap >>
                    /\ c' = c
               ELSE /\ c' = c+1
                    /\ pc' = "Lbl_2"
                    /\ UNCHANGED << array, swap >>
         /\ UNCHANGED << n, d >>

Lbl_5 == /\ pc = "Lbl_5"
         /\ d' = d+1
         /\ pc' = "Lbl_3"
         /\ UNCHANGED << array, n, c, swap >>

Lbl_4 == /\ pc = "Lbl_4"
         /\ array' = [array EXCEPT ![d+1] = swap]
         /\ pc' = "Lbl_5"
         /\ UNCHANGED << n, c, d, swap >>

Next == Lbl_1 \/ Lbl_2 \/ Lbl_3 \/ Lbl_5 \/ Lbl_4
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")




\* END TRANSLATION

=============================================================================
\* Modification History
\* Last modified Wed May 03 10:26:37 CEST 2017 by quentin
\* Created Fri Apr 14 15:19:58 CEST 2017 by quentin
