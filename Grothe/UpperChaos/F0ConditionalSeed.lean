import Grothe.UpperChaos.F0ConditionalEvaluator
import Grothe.UpperChaos.OneSidedHermiteSeed

/-!
# Original positive moments as actual conditional Gaussian seeds

The normalized zero-row seed is identified with the canonical evaluator
and the actual production coefficient, including its profile sign.
These equalities do not certify stored node centers or their errors.

Agent-ID: codex-8c4d.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.F0ConditionalSeed

noncomputable section

theorem canonicalCoefficient_zero_row (A : ℝ) (d : ℕ) :
    F0ConditionalEvaluator.canonicalCoefficient A (0, d) =
      (((Real.sqrt Real.pi / 2) * A * (-A) ^ d *
        OriginalPositiveMoment.moment d (A ^ 2) /
        Real.sqrt (d.factorial : ℝ) : ℝ) : ℂ) := by
  calc
    _ = ∫ w : ℂ, Haag.ph ((A : ℂ) + w) * conj (hfun (0, d) w) ∂gaussC := by
      unfold F0ConditionalEvaluator.canonicalCoefficient
      apply integral_congr_ae
      filter_upwards with w
      exact mul_comm _ _
    _ = _ := OneSidedHermiteSeed.phase_hermite_zero_row A d

theorem canonicalCoefficient_zero_zero (A : ℝ) :
    F0ConditionalEvaluator.canonicalCoefficient A (0, 0) =
      (((Real.sqrt Real.pi / 2) * A *
        OriginalPositiveMoment.moment 0 (A ^ 2) : ℝ) : ℂ) := by
  simpa using canonicalCoefficient_zero_row A 0

theorem coefficient_zero_row (s : ℝ) (hs : 0 ≤ s) (hv : vprof s ≠ 0) (d : ℕ) :
    F0ConditionalNode.coefficient s (0, d) =
      (F0ConditionalEvaluator.profileSign s : ℂ) ^ d *
        (((Real.sqrt Real.pi / 2) * F0ConditionalEvaluator.profileShift s *
          (-F0ConditionalEvaluator.profileShift s) ^ d *
          OriginalPositiveMoment.moment d (F0ConditionalEvaluator.profileShift s ^ 2) /
          Real.sqrt (d.factorial : ℝ) : ℝ) : ℂ) := by
  rw [F0ConditionalEvaluator.coefficient_eq_signed s hs hv (0, d),
    canonicalCoefficient_zero_row]
  simp only [Nat.zero_add]

theorem coefficient_zero_zero (s : ℝ) (hs : 0 ≤ s) (hv : vprof s ≠ 0) :
    F0ConditionalNode.coefficient s (0, 0) =
      (((Real.sqrt Real.pi / 2) * F0ConditionalEvaluator.profileShift s *
        OriginalPositiveMoment.moment 0 (F0ConditionalEvaluator.profileShift s ^ 2) : ℝ) : ℂ) := by
  rw [F0ConditionalEvaluator.coefficient_eq_signed s hs hv (0, 0),
    canonicalCoefficient_zero_zero]
  simp

end
end Grothe.UpperChaos.F0ConditionalSeed
