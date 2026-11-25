-- Grothe/MainResult.lean
import Grothe.UpperResult
import Grothe.LowerAnalytic.CapNodes
import Grothe.LowerAnalytic.SharedGateBound

/-!
# The main result: `1.4019156097 < K_G^ℂ ≤ 1.404556392`

The double inequality of the repository's goal, stated for the constant `K_G^ℂ` of `Grothe/Statement.lean`, without
hypotheses: `main_bounds`.

* **The lower bound** comes from the Gaussian witness with an identity tail `(191/250, 47/2000)`. An envelope of its
  certified rows caps the scalar value of the witness: the sharp envelope of the rows
  (`Grothe/Lower/Cert/SharpEnvelope.lean`), lowered by the saving from the Gaussian gate that the two active rows
  share (`Grothe/Lower/Cert/SharedGate.lean`). The node caps of the rows hold (`tailNodeCaps_cert`,
  `Grothe/LowerAnalytic/CapNodes.lean`), and the transfer to matrices gives `shared_gate_endpoint`: the reciprocal of
  the cap, an exact rational, is at most `K_G^ℂ`. The stated bound is that rational rounded strictly downward
  (`SharedGate.rounded_lt`).
* **The upper bound** is `Grothe.UpperSeven.constant_le` (`Grothe/UpperResult.lean`), from seven Gaussian rounding channels:
  `Grothe.UpperSeven.bound` gives `V(A) ≤ 1.4045563919697… · C(A)` for every finite complex matrix `A`. The lower proof obtains the existence of an admissible
  bound from the original six channels.

The upper bound is below Haagerup's value `1/γ†` (`Grothe.UpperSeven.constant_lt_inv_gammaDagger`).
-/

namespace Grothe.Statement

open Grothe.LowerAnalytic

/-- The exact lower endpoint: the reciprocal of the scalar cap of the witness, from the envelope of its rows with
the common Gaussian gate of row08 and row09, the mass bound and the node caps. -/
theorem shared_gate_endpoint :
    (Grothe.Lower.SharedGate.endpoint : ℝ) ≤ complexGrothendieckConstant :=
  sharedGateEndpoint_le_of_tailNodeCaps tailNodeCaps_cert ⟨_, Grothe.UpperSix.bound⟩

/-- **The main result**: the exact lower endpoint rounded strictly downward, and the seven-channel upper bound
rounded up. -/
theorem main_bounds :
    (14019156097 / 10000000000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 1404556392 / 1000000000 := by
  have hlo : (14019156097 / 10000000000 : ℝ) < complexGrothendieckConstant := by
    refine lt_of_lt_of_le ?_ shared_gate_endpoint
    simpa only [Rat.cast_div, Rat.cast_ofNat] using
      (Rat.cast_lt (K := ℝ)).mpr Grothe.Lower.SharedGate.rounded_lt
  exact ⟨hlo, Grothe.UpperSeven.constant_le⟩

end Grothe.Statement
