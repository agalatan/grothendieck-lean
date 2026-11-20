import Grothe.LowerResult
import Grothe.UpperResult

/-!
# The two-sided bound for the complex Grothendieck constant

The upper certificate supplies an element of the set of admissible bounds.
The lower certificate bounds every element of that set and hence its attained infimum.

Agent-ID: codex-a7c4.
-/

namespace Grothe.Statement

/-- The complex Grothendieck constant lies strictly between the two certified thresholds. -/
theorem main_bounds :
    (7009 / 5000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant < 1404569241261 / 10 ^ 12 := by
  obtain ⟨K, hK, _⟩ := Grothe.UpperReplacement.upper_below
  have hlo := lt_constant_of_lowerAbove ⟨K, hK⟩ lower_target
  exact ⟨by norm_num at hlo ⊢; exact hlo, Grothe.UpperReplacement.constant_lt⟩

end Grothe.Statement
