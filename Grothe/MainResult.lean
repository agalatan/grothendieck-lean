-- Grothe/MainResult.lean
import Grothe.Upper.Result
import Grothe.LowerAnalytic.CapNodes
import Grothe.LowerAnalytic.SparseSteinBound

/-!
# The main result: `1.4020221627 < K_G^ℂ ≤ 1.404556392`

The double inequality of the repository's goal, stated for the constant `K_G^ℂ` of `Grothe/Statement.lean`, without
hypotheses: `main_bounds`.

* The lower bound comes from the Gaussian identity-tail witness with parameters `(191/250, 47/2000)`.
  Transported Stein cuts price the two central rows at their common fourth excess and residual scale.
  Strict Schur curvature improves the central mixtures. Two outer rows have a joint gate deduction, and the ordinary rows 13/14 interpolate across their crossover. The amplitude envelope bounds the witness. The node caps (`tailNodeCaps_cert`) and matrix transfer give
  `sparse_stein_endpoint`. The rational endpoint is rounded strictly downward by `SparseEnvelope.rounded_lt`.
* **The upper bound** is `Grothe.Upper.constant_le` (`Grothe/Upper/Result.lean`), from a mixture of Gaussian rounding
  channels: `Grothe.Upper.bound` gives `V(A) ≤ 1.4045563919697… · C(A)` for every finite complex matrix `A`. The lower
  proof takes the existence of an admissible bound from the same theorem.

That this upper bound is below Haagerup's value `1/γ†` is proved in the article's own Lean package
(`haagerup-article/anc`, theorem `Haagerup.constant_lt_inv_gammaDagger`), not in this target.
-/

namespace Grothe.Statement

open Grothe.LowerAnalytic

/-- The reciprocal of the coupled scalar cap for the Gaussian identity-tail witness. -/
theorem sparse_stein_endpoint :
    (Grothe.Lower.SparseEnvelope.endpoint : ℝ) ≤ complexGrothendieckConstant :=
  sparseSteinEndpoint_le_of_tailNodeCaps tailNodeCaps_cert ⟨_, Grothe.Upper.bound⟩

/-- **The main result**: the exact lower endpoint rounded strictly downward, and the upper bound of the channel
mixture rounded up. -/
theorem main_bounds :
    (14020221627 / 10000000000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 1404556392 / 1000000000 := by
  have hlo : (14020221627 / 10000000000 : ℝ) < complexGrothendieckConstant := by
    refine lt_of_lt_of_le ?_ sparse_stein_endpoint
    simpa only [Rat.cast_div, Rat.cast_ofNat] using
      (Rat.cast_lt (K := ℝ)).mpr Grothe.Lower.SparseEnvelope.rounded_lt
  exact ⟨hlo, Grothe.Upper.constant_le⟩

end Grothe.Statement
