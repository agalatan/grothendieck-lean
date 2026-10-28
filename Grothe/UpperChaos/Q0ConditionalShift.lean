import Grothe.UpperChaos.Q0PhaseWickBridge
import Grothe.UpperChaos.AffineGaussianSquare

/-!
# Actual q0 conditional Gaussian shift

The positive rate, real shift, affine square completion, and shifted-Wick
integral are specialized to the actual first Taylor source. This is an
analytic component of the q0 bridge; it does not yet assemble the complete
conditional Laplace integral or prove any numerical bound.

Agent-ID: codex-8c4d
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.Q0ConditionalShift

noncomputable section

open Grothe.UpperChaos.Q0AffineCancellation
open Grothe.UpperChaos.Q0PhaseWickBridge

/-- First-source Gaussian rate before the affine tilt. -/
def q0Alpha : ℝ := 1 + (Grothe.Upper.phaseEpsQ : ℝ)

/-- Actual conditional Gaussian rate after the affine tilt. -/
def q0Rate (r t : ℝ) : ℝ := q0Alpha + kappaAtReal r ^ 2 * t

/-- Actual conditional translation after completing the affine square. -/
def q0Shift (r t : ℝ) : ℂ :=
  -((kappaAtReal r * t / q0Rate r t : ℝ) : ℂ) * (r : ℂ)

theorem q0Alpha_pos : 0 < q0Alpha := by
  norm_num [q0Alpha, Grothe.Upper.phaseEpsQ]

theorem q0Rate_pos (r t : ℝ) (ht : 0 < t) : 0 < q0Rate r t := by
  unfold q0Rate
  exact add_pos_of_pos_of_nonneg q0Alpha_pos (mul_nonneg (sq_nonneg _) ht.le)

/-- The actual shift is real, so it preserves the second-coordinate imaginary
part and hence the quadratic factor in the q0 cancellation. -/
theorem q0Shift_im (r t : ℝ) (v : ℂ) : (v + q0Shift r t).im = v.im := by
  simp [q0Shift]

/-- Completion of squares at the actual q0 rate, profile, real coordinate and
positive auxiliary scale. -/
theorem q0_affine_exponential_factor (r t : ℝ) (v : ℂ) (ht : 0 < t) :
    Real.exp (-q0Alpha * Complex.normSq (v + q0Shift r t) -
      t * Complex.normSq ((r : ℂ) + (kappaAtReal r : ℂ) * (v + q0Shift r t))) =
      Real.exp (-(q0Alpha * t * Complex.normSq (r : ℂ) / q0Rate r t)) *
        Real.exp (-q0Rate r t * Complex.normSq v) := by
  simpa only [q0Rate, q0Shift] using
    affine_gaussian_shift_exp_factor q0Alpha (kappaAtReal r) t (r : ℂ) v q0Alpha_pos ht

/-- The zero moment retains the actual inverse Gaussian mass. -/
theorem q0_shifted_gaussian_mass (r t : ℝ) :
    shiftedDampedMoment (q0Rate r t) (q0Shift r t) 0 0 = (q0Rate r t : ℂ)⁻¹ :=
  shiftedDampedMoment_zero_zero (q0Rate r t) (q0Shift r t)

/-- The actual invariant phase polynomial with the q0 imaginary-square factor
is exactly a finite shifted-Wick sum at the completed Gaussian rate and
translation. This is the centered integral only; it is not yet the full
conditional phase-Laplace integral. -/
theorem q0_centered_phase_wick (r t : ℝ) (ht : 0 < t) :
    let P := phaseInvariantSlice phaseTerms (r : ℂ)
    (∫ v : ℂ, ((v.im ^ 2 : ℝ) : ℂ) *
      (Sphase (Complex.normSq (r : ℂ)) (Complex.normSq (v + q0Shift r t))
        (conj (r : ℂ) * (v + q0Shift r t)).re : ℂ) *
      (Real.exp (-(q0Rate r t - 1) * Complex.normSq v) : ℂ) ∂gaussC) =
        ∑ k ∈ P.support, P.coeff k * imSqMoment (q0Rate r t) (q0Shift r t) (k 0) (k 1) := by
  have h := integral_q0_phase_imSq_wick r (q0Shift r t) (q0Rate_pos r t ht)
  simpa only [q0Shift_im] using h

end
end Grothe.UpperChaos.Q0ConditionalShift
