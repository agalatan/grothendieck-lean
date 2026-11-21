-- Grothe/MainResult.lean
import Grothe.LowerResult
import Grothe.UpperResult

set_option warningAsError true

/-!
# The main result: `1.40191 < K_G^ℂ ≤ 10^15 / 711962052581159 < 1.404569241261`

The double inequality of the repository's goal, stated for the constant `K_G^ℂ` of
`Grothe/Statement.lean`.

* `lower_target` (`Grothe/LowerResult.lean`): **the lower bound, unconditional**: every
  Grothendieck bound is above `1.40191`, from the certificate of the identity-tail witness
  `(191/250, 47/2000)` (`lowerTarget_of_tailNodeCaps`) and its node caps (`tailNodeCaps_cert`).
* `Grothe.UpperReplacement.bound` (`Grothe/UpperResult.lean`): **the upper bound, unconditional**:
  `10^15 / 711962052581159 < 1.404569241261` is an admissible bound for every finite complex
  matrix, from the eighteen-channel mixture certificate.
* `main_bounds`: **`1.40191 < K_G^ℂ ≤ 10^15 / 711962052581159`**, without hypotheses.

Agent-ID: codex-a7c4, gemini-1aa9
-/

namespace Grothe.Statement

/-- **The main result** `1.40191 < K_G^ℂ ≤ 10^15 / 711962052581159` (`< 1.404569241261`). -/
theorem main_bounds :
    (140191 / 100000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 1000000000000000 / 711962052581159 := by
  have hlo := lt_constant_of_lowerAbove ⟨_, Grothe.UpperReplacement.isBound⟩ lower_target
  exact ⟨by norm_num at hlo ⊢; exact hlo, Grothe.UpperReplacement.constant_le⟩

end Grothe.Statement
