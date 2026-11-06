import Grothe.LowerTarget
import Grothe.UpperTarget
import Grothe.LowerAnalytic.CapNodes
import Grothe.LowerAnalytic.CapExcluded

/-!
# The main result: `1.401697117301 < K_G^ℂ < 1.4046`

The double inequality of the repository's goal, stated for the constant `K_G^ℂ` of
`Grothe/Statement.lean`.

* `capsRest`: the remaining node-cap hypothesis holds. Every row is certified in Lean
  (`capRowsDone` lists all 19 rows), and the certified rows exclude no nodes (`capExcl_eq_nil`).
* `lower_target`: **the lower bound, unconditional**: every Grothendieck bound is above
  `1.401697117301`.
* `main_bounds`: `1.401697117301 < K_G^ℂ < 1.4046`, given the upper-bound target. The upper target is
  still conditional on the inputs of `upper_target_of_inputs`; when they are proved, `main_bounds`
  becomes a theorem without hypotheses.
-/

namespace Grothe.Statement

open Grothe.LowerAnalytic

/-- **The remaining node-cap hypothesis holds**: all rows are certified and none excludes a node. -/
theorem capsRest : CapsRest := by
  refine ⟨fun k hk hd => ?_, fun k _ => exclCaps_capExcl k⟩
  have h19 : Grothe.Lower.rowData.length = 19 := rfl
  exact absurd (by simp only [capRowsDone, List.mem_cons, List.not_mem_nil, or_false]; omega) hd

/-- **The lower bound**: every Grothendieck bound is above `1.401697117301`. -/
theorem lower_target : LowerTarget :=
  lowerTarget_of_nodeCaps (nodeCaps_of_vertexCaps (vertexCaps_of_capsRest capsRest))

/-- **The main result** `1.401697117301 < K_G^ℂ < 1.4046`, given the upper-bound target. -/
theorem main_bounds (hU : UpperTarget) :
    (1401697117301 / 10 ^ 12 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant < 14046 / 10 ^ 4 := by
  have hne : ∃ K, IsBound K := hU.imp fun _ h ↦ h.1
  have hlo := lt_constant_of_lowerAbove hne lower_target
  have hup := constant_lt_of_upperBelow hU
  exact ⟨by norm_num at hlo ⊢; exact hlo, by norm_num at hup ⊢; exact hup⟩

end Grothe.Statement
