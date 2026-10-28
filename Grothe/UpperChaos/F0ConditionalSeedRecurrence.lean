import Grothe.UpperChaos.F0ConditionalSeed
import Grothe.UpperChaos.OriginalMomentRatios
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

/-! Exact ratio recurrence for the actual Gaussian zero-row coefficients.
The ratio is the original positive moment ratio, whose finite backward
enclosure is proved independently. Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.F0ConditionalSeed

noncomputable section

private theorem sqrt_factorial_succ (d : ℕ) :
    Real.sqrt ((d + 1).factorial : ℝ) =
      Real.sqrt ((d + 1 : ℕ) : ℝ) * Real.sqrt (d.factorial : ℝ) := by
  rw [Nat.factorial_succ, Nat.cast_mul, Real.sqrt_mul (Nat.cast_nonneg _)]

theorem canonicalCoefficient_zero_row_step (A : ℝ) (d : ℕ) :
    F0ConditionalEvaluator.canonicalCoefficient A (0, d + 1) =
      (((-A) * OriginalPositiveMoment.ratio d (A ^ 2) /
        Real.sqrt ((d + 1 : ℕ) : ℝ) : ℝ) : ℂ) *
        F0ConditionalEvaluator.canonicalCoefficient A (0, d) := by
  rw [canonicalCoefficient_zero_row, canonicalCoefficient_zero_row]
  have hm : OriginalPositiveMoment.moment d (A ^ 2) ≠ 0 :=
    ne_of_gt (OriginalPositiveMoment.moment_pos d (A ^ 2))
  have hf : Real.sqrt (d.factorial : ℝ) ≠ 0 :=
    ne_of_gt (OneSidedHermiteSeed.factorial_sqrt_pos d)
  have hs : Real.sqrt ((d + 1 : ℕ) : ℝ) ≠ 0 := by positivity
  have hreal :
      (Real.sqrt Real.pi / 2) * A * (-A) ^ (d + 1) *
          OriginalPositiveMoment.moment (d + 1) (A ^ 2) /
          Real.sqrt ((d + 1).factorial : ℝ) =
        ((-A) * OriginalPositiveMoment.ratio d (A ^ 2) /
          Real.sqrt ((d + 1 : ℕ) : ℝ)) *
          ((Real.sqrt Real.pi / 2) * A * (-A) ^ d *
            OriginalPositiveMoment.moment d (A ^ 2) /
            Real.sqrt (d.factorial : ℝ)) := by
    unfold OriginalPositiveMoment.ratio
    rw [sqrt_factorial_succ, pow_succ]
    field_simp [hm, hf, hs]
    <;> ring
  simpa only [Complex.ofReal_mul] using
    congrArg (fun x : ℝ => (x : ℂ)) hreal

theorem coefficient_zero_row_step (s : ℝ) (hs : 0 ≤ s) (hv : vprof s ≠ 0)
    (d : ℕ) :
    F0ConditionalNode.coefficient s (0, d + 1) =
      ((F0ConditionalEvaluator.profileSign s * (-F0ConditionalEvaluator.profileShift s) *
        OriginalPositiveMoment.ratio d (F0ConditionalEvaluator.profileShift s ^ 2) /
        Real.sqrt ((d + 1 : ℕ) : ℝ) : ℝ) : ℂ) *
        F0ConditionalNode.coefficient s (0, d) := by
  rw [F0ConditionalEvaluator.coefficient_eq_signed s hs hv (0, d + 1),
    F0ConditionalEvaluator.coefficient_eq_signed s hs hv (0, d)]
  simp only [Nat.zero_add]
  rw [canonicalCoefficient_zero_row_step, pow_succ]
  push_cast
  ring

theorem canonicalCoefficient_zero_row_im (A : ℝ) (d : ℕ) :
    (F0ConditionalEvaluator.canonicalCoefficient A (0, d)).im = 0 := by
  rw [canonicalCoefficient_zero_row]
  exact Complex.ofReal_im _

end
end Grothe.UpperChaos.F0ConditionalSeed
