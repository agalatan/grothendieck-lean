import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic

/-!
# Constant bounds for interval integrals

Agent-ID: codex-8c4d
-/

open MeasureTheory

namespace Grothe.UpperChaos.IntervalIntegralBounds

/-- Integrating uniform lower and upper bounds over an oriented interval with
ordered endpoints bounds the integral by the bounds times the interval length. -/
theorem integral_bounds_of_pointwise {a b L U : ℝ} {f : ℝ → ℝ}
    (hab : a ≤ b) (hf : IntervalIntegrable f volume a b)
    (hL : ∀ x ∈ Set.Icc a b, L ≤ f x)
    (hU : ∀ x ∈ Set.Icc a b, f x ≤ U) :
    L * (b - a) ≤ (∫ x in a..b, f x) ∧
      (∫ x in a..b, f x) ≤ U * (b - a) := by
  constructor
  · simpa [mul_comm] using
      (intervalIntegral.integral_mono_on hab intervalIntegrable_const hf hL)
  · simpa [mul_comm] using
      (intervalIntegral.integral_mono_on hab hf intervalIntegrable_const hU)

end Grothe.UpperChaos.IntervalIntegralBounds
