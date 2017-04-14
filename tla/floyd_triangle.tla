--------------------------- MODULE floyd_triangle ---------------------------
EXTENDS TLC, Naturals
CONSTANTS n0
(*
--algorithm  floyd_triangle {
variables n,i,c,a = 1; 
{
     n := n0;
     while(i <= n) {
        while ( c <= i) {
            a := a + 1;        
        };
        i:=i+1;
     }
}

}
*)

=============================================================================
\* Modification History
\* Last modified Fri Apr 14 15:16:53 CEST 2017 by quentin
\* Created Fri Apr 14 15:08:52 CEST 2017 by quentin
