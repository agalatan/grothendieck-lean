-- Grothe/MainResult.lean
import Grothe.UpperResult
import Grothe.LowerAnalytic.CapNodes
import Grothe.LowerAnalytic.LowerBoundTight

/-!
# The main result: `1.402 < K_G^ℂ ≤ 1.404556407`

The double inequality of the repository's goal, stated for the constant `K_G^ℂ` of `Grothe/Statement.lean`, without
hypotheses: `main_bounds`.

* **The lower bound** comes from the Gaussian witness with an identity tail `(191/250, 47/2000)`. A 38-cell tightened
  envelope (`Grothe/Lower/EnvelopeTight.lean`) of its certified rows—replacing the two active rows `0.835` and `0.845`
  by their kernel-checked antiholomorphic Stein certificates (`Grothe/LowerAnalytic/AntiRows/Row08.lean`,
  `Grothe/LowerAnalytic/AntiRows/Row09.lean`) with the certified cubic radius bound `93/100`
  (`Grothe/LowerAnalytic/SharpRadius.lean`)—caps the scalar value of the witness (`Grothe/Lower/Cert/TightEnvelope.lean`).
  The node caps of the rows hold (`tailNodeCaps_cert`, `Grothe/LowerAnalytic/CapNodes.lean`), and the transfer to
  matrices gives `tight_lower_endpoint`: the reciprocal `1.4020007…` of the cap, an exact rational, is at most `K_G^ℂ`.
  The stated bound is that rational rounded strictly downward (`TightEnvelope.rounded_lt`).
* **The upper bound** is `Grothe.UpperSix.constant_le` (`Grothe/UpperResult.lean`), from the six-channel proof:
  `Grothe.UpperSix.bound` gives `V(A) ≤ 1.4045564069893… · C(A)` for every finite complex matrix `A`. That bound also
  supplies the Grothendieck bound whose existence the lower half needs (without one the set of bounds is empty and
  its infimum says nothing).

The upper bound is below Haagerup's value `1/γ†` (`Grothe.UpperSix.constant_lt_inv_gammaDagger`).
-/

namespace Grothe.Statement

open Grothe.LowerAnalytic

/-- The exact lower endpoint: the reciprocal of the tightened scalar cap of the witness, from the 38-cell envelope
with antiholomorphic Stein rows `08` and `09`, the `93/100` cubic radius bound, the mass bound and the node caps. -/
theorem tight_lower_endpoint :
    (Grothe.Lower.TightEnvelope.endpoint : ℝ) ≤ complexGrothendieckConstant :=
  tightEndpoint_le_of_tailNodeCaps tailNodeCaps_cert ⟨_, Grothe.UpperSix.bound⟩

/-- **The main result**: the exact lower endpoint rounded strictly downward, and the six-channel upper bound
rounded up. -/
theorem main_bounds :
    (1402 / 1000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 1404556407 / 1000000000 := by
  have hlo : (1402 / 1000 : ℝ) < complexGrothendieckConstant := by
    refine lt_of_lt_of_le ?_ tight_lower_endpoint
    simpa only [Rat.cast_div, Rat.cast_ofNat] using
      (Rat.cast_lt (K := ℝ)).mpr Grothe.Lower.TightEnvelope.rounded_lt
  exact ⟨hlo, Grothe.UpperSix.constant_le⟩

end Grothe.Statement
