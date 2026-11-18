import Grothe.LowerTarget
import Grothe.LowerAnalytic.CapNodes
import Grothe.LowerAnalytic.CapExcluded

/-!
# The lower bound for the complex Grothendieck constant

Every admissible Grothendieck bound exceeds `1.401700322371`. The row certificates
supply the node-cap hypothesis of `lowerTarget_of_nodeCaps`.

Agent-ID: codex-a7c4.
-/

namespace Grothe.Statement

open Grothe.LowerAnalytic

/-- **The remaining node-cap hypothesis holds**: all rows are certified and none excludes a node. -/
theorem capsRest : CapsRest := by
  refine ⟨fun k hk hd => ?_, fun k _ => exclCaps_capExcl k⟩
  have h19 : Grothe.Lower.rowData.length = 19 := rfl
  exact absurd (by simp only [capRowsDone, List.mem_cons, List.not_mem_nil, or_false]; omega) hd

/-- **The lower bound**: every Grothendieck bound is above `1.401700322371`. -/
theorem lower_target : LowerTarget :=
  lowerTarget_of_nodeCaps (nodeCaps_of_vertexCaps (vertexCaps_of_capsRest capsRest))

end Grothe.Statement
