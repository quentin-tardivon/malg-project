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

=============================================================================
\* Modification History
\* Last modified Fri Apr 14 15:27:56 CEST 2017 by quentin
\* Created Fri Apr 14 15:19:58 CEST 2017 by quentin
