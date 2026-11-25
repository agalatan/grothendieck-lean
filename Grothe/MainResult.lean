-- Grothe/MainResult.lean
import Grothe.UpperResult
import Grothe.LowerAnalytic.CapNodes
import Grothe.LowerAnalytic.CoupledSteinBound

/-!
# The main result: `1.4020110501 < K_G^ℂ ≤ 1.404556407`

The double inequality of the repository's goal, stated for the constant `K_G^ℂ` of `Grothe/Statement.lean`, without
hypotheses: `main_bounds`.

* The lower bound comes from the Gaussian identity-tail witness with parameters `(191/250, 47/2000)`.
  The two active Stein rows have a common fourth excess and residual scale. Their coupled profile bounds
  the scalar value of the witness. The node caps (`tailNodeCaps_cert`) and matrix transfer give
  `coupled_stein_endpoint`. The rational endpoint is rounded strictly downward by `CoupledStein.rounded_lt`.
* **The upper bound** is `Grothe.UpperSix.constant_le` (`Grothe/UpperResult.lean`), from the six-channel proof:
  `Grothe.UpperSix.bound` gives `V(A) ≤ 1.4045564069893… · C(A)` for every finite complex matrix `A`. That bound also
  supplies the Grothendieck bound whose existence the lower half needs (without one the set of bounds is empty and
  its infimum says nothing).

The upper bound is below Haagerup's value `1/γ†` (`Grothe.UpperSix.constant_lt_inv_gammaDagger`).
-/

namespace Grothe.Statement

open Grothe.LowerAnalytic

/-- The reciprocal of the coupled scalar cap for the Gaussian identity-tail witness. -/
theorem coupled_stein_endpoint :
    (Grothe.Lower.CoupledStein.endpoint : ℝ) ≤ complexGrothendieckConstant :=
  coupledSteinEndpoint_le_of_tailNodeCaps tailNodeCaps_cert ⟨_, Grothe.UpperSix.bound⟩

/-- **The main result**: the exact lower endpoint rounded strictly downward, and the six-channel upper bound
rounded up. -/
theorem main_bounds :
    (14020110501 / 10000000000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 1404556407 / 1000000000 := by
  have hlo : (14020110501 / 10000000000 : ℝ) < complexGrothendieckConstant := by
    refine lt_of_lt_of_le ?_ coupled_stein_endpoint
    simpa only [Rat.cast_div, Rat.cast_ofNat] using
      (Rat.cast_lt (K := ℝ)).mpr Grothe.Lower.CoupledStein.rounded_lt
  exact ⟨hlo, Grothe.UpperSix.constant_le⟩

end Grothe.Statement
