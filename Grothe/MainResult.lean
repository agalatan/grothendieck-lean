-- Grothe/MainResult.lean
import Grothe.LowerTarget
import Grothe.UpperTightFinal
import Grothe.LowerAnalytic.CapNodes

/-!
# The main result: `1.4018 < K_G^ℂ < 1.404599395362`

The double inequality of the repository's goal, stated for the constant `K_G^ℂ` of `Grothe/Statement.lean`.

* `lower_target`: **the lower bound, unconditional**: every Grothendieck bound is above `1.4018`, from the certificate of
  the witness `(191/250, 47/2000)` (`lowerTarget_of_tailNodeCaps`) and the node caps of its rows (`tailNodeCaps_cert`).
* `upper_below_tight` (`Grothe/UpperTightFinal.lean`): **the upper bound, unconditional**: some
  Grothendieck bound is below `1.404599395362`.
* `main_bounds`: **`1.4018 < K_G^ℂ < 1.404599395362`**, without hypotheses.
-/

namespace Grothe.Statement

open Grothe.LowerAnalytic

/-- **The lower bound**: every Grothendieck bound is above `1.4018`. -/
theorem lower_target : LowerTarget :=
  lowerTarget_of_tailNodeCaps tailNodeCaps_cert

/-- **The main result** `1.4018 < K_G^ℂ < 1.404599395362`. -/
theorem main_bounds :
    (7009 / 5000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant < 1404599395362 / 10 ^ 12 := by
  have hU := upper_below_tight
  have hne : ∃ K, IsBound K := hU.imp fun _ h ↦ h.1
  have hlo := lt_constant_of_lowerAbove hne lower_target
  have hup := constant_lt_of_upperBelow hU
  exact ⟨by norm_num at hlo ⊢; exact hlo, by norm_num at hup ⊢; exact hup⟩

end Grothe.Statement
