import Grothe.StatementBridges
import Grothe.Research.RefinedCoverResult

/-!
# The lower-bound target, from the proof

`Grothe.Statement.LowerTarget` (`every Grothendieck bound is above 1.401697117301`,
`Grothe/Statement.lean`) follows from the refined-cover certificate under the node-cap hypothesis
`NodeCaps` (all 19 potential rows below their caps): `lowerTarget_of_nodeCaps`. With
`Grothe.Statement.lt_constant_of_lowerAbove` it gives `1.401697117301 < K_G^ℂ` as soon as some
Grothendieck bound exists.

This module deliberately imports only the certificate, not `Grothe.LowerAnalytic.CapNodes` (the
node-cap rows themselves, hours of computation): the reduction of `NodeCaps` to the rows CI
certifies is `lower_bound_of_capsRest` there.
-/

namespace Grothe.Statement

theorem lowerTarget_of_nodeCaps (h : Grothe.LowerAnalytic.NodeCaps) : LowerTarget := fun K hK =>
  lt_of_eq_of_lt (by norm_num [Grothe.Research.RefinedCoverData.refinedL])
    (Grothe.Research.RefinedLowerCheck.lower_bound_of_refined_cover_data h (isBound_iff.mp hK))

end Grothe.Statement
