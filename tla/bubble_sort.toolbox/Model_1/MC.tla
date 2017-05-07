---- MODULE MC ----
EXTENDS bubble_sort, TLC

\* CONSTANT definitions @modelParameterConstants:0defaultInitValue
const_1494148180015205000 == 
0
----

\* CONSTANT definitions @modelParameterConstants:1n
const_1494148180025206000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:2min
const_1494148180036207000 == 
0
----

\* CONSTANT definitions @modelParameterConstants:3max
const_1494148180047208000 == 
65535
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1494148180058209000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1494148180069210000 ==
Prec1
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1494148180080211000 ==
Prec2
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_1494148180091212000 ==
Prec3
----
\* INVARIANT definition @modelCorrectnessInvariants:3
inv_1494148180102213000 ==
Correctness
----
\* INVARIANT definition @modelCorrectnessInvariants:4
inv_1494148180112214000 ==
Overflow
----
=============================================================================
\* Modification History
\* Created Sun May 07 11:09:40 CEST 2017 by quentin
