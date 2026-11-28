-- Grothe/MainResult.lean
import Grothe.UpperResult
import Grothe.LowerAnalytic.CapNodes
import Grothe.LowerAnalytic.Fifth.Profile

/-!
# The main result: `1.4020271882 < K_G^ℂ ≤ 1.404550522`

The double inequality of the repository's goal, stated for the constant `K_G^ℂ` of `Grothe/Statement.lean`, without
hypotheses: `main_bounds`.

* **The lower bound** uses the retuned identity-tail witness minus a degree-five Hermite projection
  with coefficient $10^{-8}$. Radial clipping bounds its signed contribution at every amplitude,
  and projection onto the fifth visible Hermite polynomial improves the bound above the cutoff.
  The sparse Stein row estimates and the proved node caps give `signed_fifth_endpoint`.
* **The upper bound** is `Grothe.UpperBivar.constant_le` (`Grothe/UpperResult.lean`), from multi-channel bivariate Gaussian roundings:
  `Grothe.UpperBivar.bound` gives `V(A) ≤ 1.4045505219427… · C(A)` for every finite complex matrix `A`. The lower proof obtains the existence of an admissible
  bound from the original six channels.

The upper bound is below Haagerup's value `1/γ†` (`Grothe.UpperBivar.constant_lt_inv_gammaDagger`).
-/

namespace Grothe.Statement

open Grothe.LowerAnalytic

/-- The exact finite-matrix lower endpoint of the first-chaos retuning. -/
theorem first_chaos_endpoint :
    (Grothe.Lower.FirstChaos.endpoint : ℝ) ≤ complexGrothendieckConstant :=
  firstChaosEndpoint_le_of_tailNodeCaps tailNodeCaps_cert ⟨_, Grothe.UpperSix.bound⟩

/-- The physical signed fifth-degree operator gives this exact finite-matrix lower bound. -/
theorem signed_fifth_endpoint :
    (Grothe.Lower.SignedFifth.endpoint : ℝ) ≤ complexGrothendieckConstant := by
  rw [Grothe.Lower.SignedFifth.endpoint, Rat.cast_div, Rat.cast_one]
  exact signedFifthEndpoint_le_of_tailNodeCaps tailNodeCaps_cert ⟨_, Grothe.UpperSix.bound⟩

/-- **The main result**: the exact lower endpoint rounded strictly downward, and the multi-channel upper bound
rounded up. -/
theorem main_bounds :
    (14020271882 / 10000000000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 1404550522 / 1000000000 := by
  have hlo : (14020271882 / 10000000000 : ℝ) < complexGrothendieckConstant := by
    refine lt_of_lt_of_le ?_ signed_fifth_endpoint
    simpa only [Rat.cast_div, Rat.cast_ofNat] using
      (Rat.cast_lt (K := ℝ)).mpr Grothe.Lower.SignedFifth.rounded_lt
  exact ⟨hlo, Grothe.UpperBivar.constant_le⟩

end Grothe.Statement
