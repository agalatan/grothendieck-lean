-- Grothe/MainResult.lean
import Grothe.LowerTarget
import Grothe.UpperResult
import Grothe.LowerAnalytic.CapNodes

/-!
# The main result: `1.40191 < K_G^ℂ ≤ 1.40455741`

The double inequality of the repository's goal, stated for the constant `K_G^ℂ` of `Grothe/Statement.lean`.

* `lower_target`: **the lower bound, unconditional**: every Grothendieck bound is above `1.40191`, from the certificate of
  the witness `(191/250, 47/2000)` (`lowerTarget_of_tailNodeCaps`) and the node caps of its rows (`tailNodeCaps_cert`).
* `Grothe.UpperSix.bound`: **the upper bound, unconditional**: `V(A) ≤ 1.40455741 · C(A)` for every finite complex
  matrix `A` (`IsBound (140455741 / 100000000)`), from the six-channel proof.
* `main_bounds`: **`1.40191 < K_G^ℂ ≤ 1.40455741`**, without hypotheses.
-/

namespace Grothe.Statement

open Grothe.LowerAnalytic

/-- **The lower bound**: every Grothendieck bound is above `1.40191`. -/
theorem lower_target : LowerTarget :=
  lowerTarget_of_tailNodeCaps tailNodeCaps_cert

/-- **The main result** `1.40191 < K_G^ℂ ≤ 1.40455741`. -/
theorem main_bounds :
    (140191 / 100000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 140455741 / 100000000 := by
  have hlo := lt_constant_of_lowerAbove ⟨_, Grothe.UpperSix.bound⟩ lower_target
  exact ⟨by norm_num at hlo ⊢; exact hlo, Grothe.UpperSix.constant_le⟩

end Grothe.Statement
