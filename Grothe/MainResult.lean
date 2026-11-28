-- Grothe/MainResult.lean
import Grothe.UpperResult
import Grothe.LowerAnalytic.CapNodes
import Grothe.LowerAnalytic.SparseSteinBound

/-!
# The main result: `1.4020221627 < K_G^ℂ ≤ 1.404554025`

The double inequality of the repository's goal, stated for the constant `K_G^ℂ` of `Grothe/Statement.lean`, without
hypotheses: `main_bounds`.

* The lower bound comes from the Gaussian identity-tail witness with parameters `(191/250, 47/2000)`.
  Transported Stein cuts price the two central rows at their common fourth excess and residual scale.
  Strict Schur curvature improves the central mixtures. Two outer rows have a joint gate deduction, and the ordinary rows 13/14 interpolate across their crossover. The amplitude envelope bounds the witness. The node caps (`tailNodeCaps_cert`) and matrix transfer give
  `sparse_stein_endpoint`. The rational endpoint is rounded strictly downward by `SparseEnvelope.rounded_lt`.
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

/-- Refining the binding interval of the pure identity-tail witness improves its matrix endpoint. -/
theorem sparse_midpoint_endpoint :
    (Grothe.Lower.SparseEnvelope.Midpoint.endpoint : ℝ) ≤ complexGrothendieckConstant :=
  sparseMidpointEndpoint_le_of_tailNodeCaps tailNodeCaps_cert ⟨_, Grothe.UpperSix.bound⟩

/-- **The main result**: the exact lower endpoint rounded strictly downward, and the multi-channel upper bound
rounded up. -/
theorem main_bounds :
    (14020221627 / 10000000000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 1404554025 / 1000000000 := by
  have hlo : (14020221627 / 10000000000 : ℝ) < complexGrothendieckConstant := by
    refine lt_of_lt_of_le ?_ sparse_stein_endpoint
    simpa only [Rat.cast_div, Rat.cast_ofNat] using
      (Rat.cast_lt (K := ℝ)).mpr Grothe.Lower.SparseEnvelope.rounded_lt
  exact ⟨hlo, Grothe.UpperBivar.constant_le⟩

end Grothe.Statement
