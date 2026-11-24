-- Grothe/MainResult.lean
import Grothe.LowerTarget
import Grothe.UpperResult
import Grothe.LowerAnalytic.CapNodes
import Grothe.LowerAnalytic.SharpEnvelopeBound

/-!
# The main result: `1.40191 < K_G^ℂ ≤ 1.40455741`

The double inequality of the repository's goal, stated for the constant `K_G^ℂ` of `Grothe/Statement.lean`.

* `lower_bound_sharp` proves **`1.4019109461 < K_G^ℂ`** from the affine mixture of the same certified rows.
* `lower_target`: **the lower bound, unconditional**: every Grothendieck bound is above `1.40191`, from the certificate of
  the witness `(191/250, 47/2000)` (`lowerTarget_of_tailNodeCaps`) and the node caps of its rows (`tailNodeCaps_cert`).
* `Grothe.UpperSix.bound`: **the upper bound, unconditional**: `V(A) ≤ 1.40455741 · C(A)` for every finite complex
  matrix `A` (`IsBound (140455741 / 100000000)`), from the six-channel proof.
* `main_bounds_refined`: **`1.40191 < K_G^ℂ ≤ 1.40455641`**, from the refined six-channel proof.
* `main_bounds`: **`1.40191 < K_G^ℂ ≤ 1.40455741`**, without hypotheses.
-/

namespace Grothe.Statement

open Grothe.LowerAnalytic

/-- **The lower bound**: every Grothendieck bound is above `1.40191`. -/
theorem lower_target : LowerTarget :=
  lowerTarget_of_tailNodeCaps tailNodeCaps_cert

/-- Exact lower endpoint from the sharp envelope of the fourteen rows and the mass bound. -/
theorem sharp_lower_endpoint :
    (Grothe.Lower.SharpEnvelope.endpoint : ℝ) ≤ complexGrothendieckConstant :=
  sharpEndpoint_le_of_tailNodeCaps tailNodeCaps_cert ⟨_, Grothe.UpperSix.bound⟩

/-- The sharp lower endpoint rounded strictly downward to ten decimal places. -/
theorem lower_bound_sharp :
    (14019109461 / 10000000000 : ℝ) < complexGrothendieckConstant := by
  refine lt_of_lt_of_le ?_ sharp_lower_endpoint
  simpa only [Rat.cast_div, Rat.cast_ofNat] using
    (Rat.cast_lt (K := ℝ)).mpr Grothe.Lower.SharpEnvelope.rounded_lt

/-- **The main result** `1.40191 < K_G^ℂ ≤ 1.40455741`. -/
theorem main_bounds :
    (140191 / 100000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 140455741 / 100000000 := by
  have hlo := lt_constant_of_lowerAbove ⟨_, Grothe.UpperSix.bound⟩ lower_target
  exact ⟨by norm_num at hlo ⊢; exact hlo, Grothe.UpperSix.constant_le⟩

/-- The root six-channel certificate rounded upward to eight decimals. -/
theorem main_bounds_refined :
    (140191 / 100000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 140455641 / 100000000 := by
  have hlo := lt_constant_of_lowerAbove ⟨_, Grothe.UpperSix.bound_exact⟩ lower_target
  exact ⟨by norm_num at hlo ⊢; exact hlo,
    Grothe.UpperSix.constant_le_exact.trans (by norm_num)⟩

end Grothe.Statement
