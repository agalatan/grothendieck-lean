-- Grothe/MainResult.lean
import Grothe.LowerTarget
import Grothe.UpperResult
import Grothe.LowerAnalytic.CapNodes
import Grothe.LowerAnalytic.SharpEnvelopeBound
import Grothe.LowerAnalytic.SharedGateBound
import Grothe.LowerAnalytic.TightSharedBound

/-!
# The main result: `1.402 < K_G^ℂ ≤ 1.40455741`

The double inequality of the repository's goal, stated for the constant `K_G^ℂ` of `Grothe/Statement.lean`.

* `lower_target`: **the lower bound, unconditional**: every Grothendieck bound is above `1.402`, from the certificate of
  the witness `(191/250, 47/2000)` (`lowerTarget_of_tailNodeCaps`, with antiholomorphic Stein tightening on `row08` and
  `row09` and the certified cubic radius bound `93/100`) and the node caps of its rows (`tailNodeCaps_cert`).
* `lower_bound_shared_gate` gives **`1.4019156097 < K_G^ℂ`** by coupling the active gates of the scalar-row certificate.
* `lower_bound_sharp` proves **`1.4019109461 < K_G^ℂ`** from the affine mixture of the same scalar-row certificate.
* `Grothe.UpperSix.bound`: **the upper bound, unconditional**: `V(A) ≤ 1.40455741 · C(A)` for every finite complex
  matrix `A` (`IsBound (140455741 / 100000000)`), from the six-channel proof.
* `main_bounds_phase`: **`1.402 < K_G^ℂ ≤ 1.404556407`**, from the longer phase head.
* `main_bounds_refined`: **`1.402 < K_G^ℂ ≤ 1.40455641`**, from the refined six-channel proof.
* `main_bounds`: **`1.402 < K_G^ℂ ≤ 1.40455741`**, without hypotheses.
-/

namespace Grothe.Statement

open Grothe.LowerAnalytic

/-- **The lower bound**: every Grothendieck bound is above `1.402`. -/
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

/-- The common Gaussian gate of row08 and row09 gives this exact lower endpoint. -/
theorem shared_gate_endpoint :
    (Grothe.Lower.SharedGate.endpoint : ℝ) ≤ complexGrothendieckConstant :=
  sharedGateEndpoint_le_of_tailNodeCaps tailNodeCaps_cert ⟨_, Grothe.UpperSix.bound⟩

/-- The tightened circular rows, coupled at their common gate, give this exact lower endpoint. -/
theorem tight_shared_endpoint :
    (Grothe.Lower.TightShared.endpoint : ℝ) ≤ complexGrothendieckConstant :=
  tightSharedEndpoint_le_of_tailNodeCaps tailNodeCaps_cert ⟨_, Grothe.UpperSix.bound⟩

/-- The common-gate lower endpoint rounded strictly downward to ten decimals. -/
theorem lower_bound_shared_gate :
    (14019156097 / 10000000000 : ℝ) < complexGrothendieckConstant := by
  refine lt_of_lt_of_le ?_ shared_gate_endpoint
  simpa only [Rat.cast_div, Rat.cast_ofNat] using
    (Rat.cast_lt (K := ℝ)).mpr Grothe.Lower.SharedGate.rounded_lt

/-- **The main result** `1.402 < K_G^ℂ ≤ 1.40455741`. -/
theorem main_bounds :
    (1402 / 1000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 140455741 / 100000000 := by
  have hlo := lt_constant_of_lowerAbove ⟨_, Grothe.UpperSix.bound⟩ lower_target
  exact ⟨by norm_num at hlo ⊢; exact hlo, Grothe.UpperSix.constant_le⟩

/-- The root six-channel certificate rounded upward to eight decimals. -/
theorem main_bounds_refined :
    (1402 / 1000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 140455641 / 100000000 := by
  have hlo := lt_constant_of_lowerAbove ⟨_, Grothe.UpperSix.bound_exact⟩ lower_target
  exact ⟨by norm_num at hlo ⊢; exact hlo,
    Grothe.UpperSix.constant_le_exact.trans (by norm_num)⟩

/-- Two-sided bound using 321 phase coefficients and 251 coefficients in each cell channel. -/
theorem main_bounds_phase :
    (1402 / 1000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 1404556407 / 1000000000 := by
  exact ⟨main_bounds_refined.1, Grothe.UpperSix.constant_le_phase.trans (by norm_num)⟩

end Grothe.Statement
