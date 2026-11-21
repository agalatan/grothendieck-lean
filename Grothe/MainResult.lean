-- Grothe/MainResult.lean
import Grothe.LowerResult
import Grothe.UpperResult

set_option warningAsError true

/-!
# The main result: `1.40191 < K_G^ℂ ≤ 10^{15} / 711962052581159 < 1.404569241261`

The double inequality of the repository's goal, stated for the constant `K_G^ℂ` of
`Grothe/Statement.lean`.

* `lower_target`: **the lower bound, unconditional**: every Grothendieck bound is above `1.40191`,
  from the certificate of the witness `(191/250, 47/2000)` (`lowerTarget_of_tailNodeCaps`) and the
  node caps of its rows (`tailNodeCaps_cert`).
* `Grothe.UpperReplacement.bound` proves the admissibility of `1000000000000000 / 711962052581159`
  for every matrix, giving `K_G^ℂ ≤ 1000000000000000 / 711962052581159 < 1404569241261 / 10^12`.
* `main_bounds`: **`1.40191 < K_G^ℂ ≤ 1000000000000000 / 711962052581159`**, without hypotheses.

Agent-ID: gemini-21d5
-/

namespace Grothe.Statement

/-- **The main result** `1.40191 < K_G^ℂ ≤ 1000000000000000 / 711962052581159`. -/
theorem main_bounds :
    (140191 / 100000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 1000000000000000 / 711962052581159 :=
  ⟨lt_constant_of_lowerAbove ⟨_, isBound_iff.mpr Grothe.UpperReplacement.bound⟩ lower_target,
    Grothe.UpperReplacement.constant_le⟩

end Grothe.Statement
