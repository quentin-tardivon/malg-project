---- MODULE MC ----
EXTENDS floyd_triangle, TLC

\* CONSTANT definitions @modelParameterConstants:0n0
const_1494148275434253000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:1defaultInitValue
const_1494148275445254000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:2min
const_1494148275455255000 == 
0
----

\* CONSTANT definitions @modelParameterConstants:3max
const_1494148275466256000 == 
16000
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1494148275477257000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1494148275488258000 ==
Q1
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1494148275499259000 ==
Q2
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_1494148275510260000 ==
Prec1
----
\* INVARIANT definition @modelCorrectnessInvariants:3
inv_1494148275521261000 ==
Prec2
----
\* INVARIANT definition @modelCorrectnessInvariants:4
inv_1494148275532262000 ==
Prec3
----
\* INVARIANT definition @modelCorrectnessInvariants:5
inv_1494148275544263000 ==
Overflow
----
\* INVARIANT definition @modelCorrectnessInvariants:6
inv_1494148275554264000 ==
Correctness
----
=============================================================================
\* Modification History
\* Created Sun May 07 11:11:15 CEST 2017 by quentin
