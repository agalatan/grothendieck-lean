-- Grothe/MainResult.lean
import Grothe.UpperResult
import Grothe.LowerAnalytic.CapNodes
import Grothe.LowerAnalytic.SharpEnvelopeBound

/-!
# The main result: `1.4019109461 < K_G^ℂ ≤ 1.404556407`

The double inequality of the repository's goal, stated for the constant `K_G^ℂ` of `Grothe/Statement.lean`, without
hypotheses: `main_bounds`.

* **The lower bound** `14019109461 / 10000000000 < K_G^ℂ` comes from the Gaussian witness with an identity tail
  `(191/250, 47/2000)`. The sharp envelope of its certified rows caps the scalar value of the witness
  (`Grothe/Lower/Cert/SharpEnvelope.lean`), the node caps of the rows hold (`tailNodeCaps_cert`,
  `Grothe/LowerAnalytic/CapNodes.lean`), and the transfer to matrices gives `sharp_lower_endpoint`: the reciprocal of
  the cap, an exact rational `1.4019109461135…`, is at most `K_G^ℂ`. The stated bound is that rational rounded
  strictly downward to ten decimals (`SharpEnvelope.rounded_lt`).
* **The upper bound** `K_G^ℂ ≤ 1404556407 / 1000000000` is `Grothe.UpperSix.constant_le` (`Grothe/UpperResult.lean`),
  from the six-channel proof: `Grothe.UpperSix.bound` gives `V(A) ≤ 1.4045564069893… · C(A)` for every finite complex
  matrix `A`. That bound also supplies the Grothendieck bound whose existence the lower half needs (without one the
  set of bounds is empty and its infimum says nothing).

The upper bound is below Haagerup's value `1/γ†` (`Grothe.UpperSix.constant_lt_inv_gammaDagger`).
-/

namespace Grothe.Statement

open Grothe.LowerAnalytic

/-- The exact lower endpoint: the reciprocal of the scalar cap of the witness, from the sharp envelope of its rows,
the mass bound and the node caps. -/
theorem sharp_lower_endpoint :
    (Grothe.Lower.SharpEnvelope.endpoint : ℝ) ≤ complexGrothendieckConstant :=
  sharpEndpoint_le_of_tailNodeCaps tailNodeCaps_cert ⟨_, Grothe.UpperSix.bound⟩

/-- **The main result** `1.4019109461 < K_G^ℂ ≤ 1.404556407`: the exact lower endpoint rounded strictly downward to
ten decimals, and the six-channel upper bound rounded up to nine. -/
theorem main_bounds :
    (14019109461 / 10000000000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 1404556407 / 1000000000 := by
  have hlo : (14019109461 / 10000000000 : ℝ) < complexGrothendieckConstant := by
    refine lt_of_lt_of_le ?_ sharp_lower_endpoint
    simpa only [Rat.cast_div, Rat.cast_ofNat] using
      (Rat.cast_lt (K := ℝ)).mpr Grothe.Lower.SharpEnvelope.rounded_lt
  exact ⟨hlo, Grothe.UpperSix.constant_le⟩

end Grothe.Statement
