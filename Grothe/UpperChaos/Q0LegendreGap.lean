import Grothe.UpperChaos.Q0LegendreWeight
import LeanCert.Core.IntervalDyadic

/-! Certified lower bounds on the absolute value of any real in a rational
interval. Agent-ID: codex-aa04. -/

open LeanCert.Core

namespace Grothe.UpperChaos.Q0LegendreInteger

def intervalGap (I : IntervalRat) : ℚ := max 0 (max I.lo (-I.hi))

theorem intervalGap_nonneg (I : IntervalRat) : 0 ≤ intervalGap I := le_max_left _ _

theorem intervalGap_le_abs (I : IntervalRat) {x : ℝ} (hx : x ∈ I) :
    (intervalGap I : ℝ) ≤ |x| := by
  have hlow : (I.lo : ℝ) ≤ x := hx.1
  have hhigh : x ≤ (I.hi : ℝ) := hx.2
  have hg : (intervalGap I : ℝ) = max 0 (max (I.lo : ℝ) (-(I.hi : ℝ))) := by
    simp [intervalGap]
  rw [hg]
  exact max_le (abs_nonneg x)
    (max_le (hlow.trans (le_abs_self x)) ((neg_le_neg hhigh).trans (neg_le_abs x)))

end Grothe.UpperChaos.Q0LegendreInteger
