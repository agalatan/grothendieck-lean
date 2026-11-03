import Grothe.UpperChaos.Q0GaussPhysical
import Grothe.UpperChaos.Q0LegendreRule01
import Grothe.UpperChaos.Q0LegendreWeightRule01

/-! Actual selected recurrence roots satisfy checked formula-weight bounds.
Gauss-rule identity and original integration error remain separate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0LegendreRootWeightRule01

open Grothe.UpperChaos.Q0LegendreInteger Grothe.UpperChaos.Q0LegendreRuleBase

theorem boundr00 {x : ℝ}
    (hx : x ∈ Set.Icc (((-1 : ℤ) : ℝ) / denominator) (((2 : ℤ) : ℝ) / denominator)) :
    weight 0 x ≤ (Grothe.UpperChaos.Q0LegendreWeightRule01.r00Upper : ℝ) := by
  apply Grothe.UpperChaos.Q0LegendreWeightRule01.r00Bound
  have hle : ((-1 : ℤ) : ℚ) / denominator ≤ ((2 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule01.r00Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg, Int.cast_one] using Grothe.UpperChaos.Q0LegendreWeightRule01.r00Input.le
  have hmem := mem_rational_interval_of_integer_bracket (-1) (2) denominator hle hx
  simpa only [Grothe.UpperChaos.Q0LegendreWeightRule01.r00Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg, Int.cast_one] using hmem

theorem rootr00 :
    ∃ x ∈ Set.Icc (((-1 : ℤ) : ℝ) / denominator) (((2 : ℤ) : ℝ) / denominator),
      (realPair x 0).2 = 0 ∧ weight 0 x ≤ (Grothe.UpperChaos.Q0LegendreWeightRule01.r00Upper : ℝ) := by
  obtain ⟨x, hx, hr⟩ := Grothe.UpperChaos.Q0LegendreRule01.root00
  exact ⟨x, hx, hr, boundr00 hx⟩

end Grothe.UpperChaos.Q0LegendreRootWeightRule01
