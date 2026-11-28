-- Grothe/MainResult.lean
import Grothe.UpperResult
import Grothe.LowerAnalytic.CapNodes
import Grothe.LowerAnalytic.QuinticMixedProfile

/-!
# The main result: `1.4020236979 < K_G^ℂ ≤ 1.404554025`

The double inequality of the repository's goal, stated for the constant `K_G^ℂ` of `Grothe/Statement.lean`, without
hypotheses: `main_bounds`.

* The lower bound uses a convex mixture of the identity-tail witness and a polynomial
  witness supported on the first, third and fifth chaoses. On the same phase pair,
  the sparse row certificates price the normalized identity-tail payoff together with
  its first-chaos amplitude. The shared vector test and the existing node caps
  give the exact reciprocal in `quintic_hybrid_endpoint`.
* **The upper bound** is `Grothe.UpperBivar.constant_le` (`Grothe/UpperResult.lean`), from multi-channel bivariate Gaussian roundings:
  `Grothe.UpperBivar.bound` gives `V(A) ≤ 1.4045540246340… · C(A)` for every finite complex matrix `A`. The lower proof obtains the existence of an admissible
  bound from the original six channels.

The upper bound is below Haagerup's value `1/γ†` (`Grothe.UpperBivar.constant_lt_inv_gammaDagger`).
-/

namespace Grothe.Statement

open Grothe.LowerAnalytic

/-- The reciprocal of the coupled scalar cap for the Gaussian identity-tail witness. -/
theorem sparse_stein_endpoint :
    (Grothe.Lower.SparseEnvelope.endpoint : ℝ) ≤ complexGrothendieckConstant :=
  sparseSteinEndpoint_le_of_tailNodeCaps tailNodeCaps_cert ⟨_, Grothe.UpperSix.bound⟩

/-- The exact finite-matrix lower endpoint of the retuned mixed degree-five witness. -/
theorem quintic_hybrid_endpoint :
    (Grothe.Lower.QuinticHybrid.endpoint : ℝ) ≤ complexGrothendieckConstant :=
  quinticHybridEndpoint_le_of_tailNodeCaps tailNodeCaps_cert ⟨_, Grothe.UpperSix.bound⟩

/-- **The main result**: the exact lower endpoint rounded strictly downward, and the multi-channel upper bound
rounded up. -/
theorem main_bounds :
    (14020236979 / 10000000000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 1404554025 / 1000000000 := by
  have hlo : (14020236979 / 10000000000 : ℝ) < complexGrothendieckConstant := by
    refine lt_of_lt_of_le ?_ quintic_hybrid_endpoint
    simpa only [Rat.cast_div, Rat.cast_ofNat] using
      (Rat.cast_lt (K := ℝ)).mpr Grothe.Lower.QuinticHybrid.rounded_lt
  exact ⟨hlo, Grothe.UpperBivar.constant_le⟩

end Grothe.Statement
