-- Grothe/LowerTarget.lean
import Grothe.StatementBridges
import Grothe.LowerAnalytic.LowerBound

/-!
# The lower-bound target, from the proof

`Grothe.Statement.LowerTarget` (`every Grothendieck bound is above 1.4018`, `Grothe/Statement.lean`) follows from the
certificate of the witness with an identity tail `(191/250, 47/2000)` under the node-cap hypothesis
`TailNodeCaps (nuHat (47/2000))` (the node caps of the potentials of the 14 rows with the tail):
`lowerTarget_of_tailNodeCaps`. With `Grothe.Statement.lt_constant_of_lowerAbove` it gives `1.4018 < K_G^ℂ` as soon as
some Grothendieck bound exists.

This module deliberately imports only the certificate, not `Grothe.LowerAnalytic.CapNodes` (the node caps themselves,
hundreds of CPU-hours of computation): `tailNodeCaps_cert` there proves the hypothesis.
-/

namespace Grothe.Statement

theorem lowerTarget_of_tailNodeCaps
    (h : Grothe.LowerAnalytic.TailNodeCaps (Grothe.LowerAnalytic.nuHat (47 / 2000))) : LowerTarget := fun K hK =>
  lt_of_lt_of_le (by norm_num [Grothe.Lower.envB])
    (Grothe.LowerAnalytic.lower_bound_of_tailNodeCaps h (isBound_iff.mp hK))

end Grothe.Statement
