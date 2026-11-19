-- Grothe/MainResult.lean
import Grothe.LowerTarget
import Grothe.UpperResult
import Grothe.LowerAnalytic.CapNodes

/-!
# The main result: `1.4018 < K_G^ℂ ≤ 1.40457588`

The double inequality of the repository's goal, stated for the constant `K_G^ℂ` of `Grothe/Statement.lean`.

* `lower_target`: **the lower bound, unconditional**: every Grothendieck bound is above `1.4018`, from the certificate of
  the witness `(191/250, 47/2000)` (`lowerTarget_of_tailNodeCaps`) and the node caps of its rows (`tailNodeCaps_cert`).
* `Grothe.UpperSix.bound` proves the admissibility of `140457588 / 100000000` for every matrix.
* `main_bounds`: **`1.4018 < K_G^ℂ ≤ 1.40457588`**, without hypotheses.
-/

namespace Grothe.Statement

open Grothe.LowerAnalytic

/-- **The lower bound**: every Grothendieck bound is above `1.4018`. -/
theorem lower_target : LowerTarget :=
  lowerTarget_of_tailNodeCaps tailNodeCaps_cert

/-- **The main result** `1.4018 < K_G^ℂ ≤ 1.40457588`. -/
theorem main_bounds :
    (7009 / 5000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 140457588 / 100000000 := by
  have hlo := lt_constant_of_lowerAbove ⟨_, Grothe.UpperSix.bound⟩ lower_target
  exact ⟨by norm_num at hlo ⊢; exact hlo, Grothe.UpperSix.constant_le⟩

end Grothe.Statement
