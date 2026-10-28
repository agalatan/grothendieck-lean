import Grothe.UpperChaos.Q0ImaginaryWick
import Grothe.UpperChaos.Q0AffineCancellation
import Grothe.UpperChaos.ConditionalGaussianPolynomial
import Grothe.UpperChaos.GradedHermitePhaseSlice

/-!
# The actual q0 phase polynomial as a finite shifted-Wick sum

The pointwise affine cancellation leaves `Im(w)^2` times the actual invariant
phase polynomial. This file evaluates that polynomial against any positively
tilted, shifted complex Gaussian by finite sums of existing shifted damped
moments. The shift and rate are arbitrary; the separate completion-of-squares
bridge, coefficient compression and numerical enclosure are not asserted.

Agent-ID: codex-8c4d
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.Q0PhaseWickBridge

noncomputable section

/-- The three-moment expression for an imaginary-square insertion. -/
def imSqMoment (rate : ℝ) (μ : ℂ) (p q : ℕ) : ℂ :=
  (2 * shiftedDampedMoment rate μ (p + 1) (q + 1) -
    shiftedDampedMoment rate μ (p + 2) q -
    shiftedDampedMoment rate μ p (q + 2)) / 4

private theorem integrable_imSq_shifted_monomial (p q : ℕ) (μ : ℂ)
    {rate : ℝ} (hrate : 0 < rate) :
    Integrable (fun z : ℂ => (((z + μ).im ^ 2 : ℝ) : ℂ) *
      (z + μ) ^ p * conj (z + μ) ^ q *
        (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ)) gaussC := by
  let f₁ : ℂ → ℂ := fun z => (z + μ) ^ (p + 1) * conj (z + μ) ^ (q + 1) *
    (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ)
  let f₂ : ℂ → ℂ := fun z => (z + μ) ^ (p + 2) * conj (z + μ) ^ q *
    (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ)
  let f₃ : ℂ → ℂ := fun z => (z + μ) ^ p * conj (z + μ) ^ (q + 2) *
    (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ)
  have hf₁ : Integrable f₁ gaussC := integrable_shifted_monomial_damped (p + 1) (q + 1) μ hrate
  have hf₂ : Integrable f₂ gaussC := integrable_shifted_monomial_damped (p + 2) q μ hrate
  have hf₃ : Integrable f₃ gaussC := integrable_shifted_monomial_damped p (q + 2) μ hrate
  have h : (fun z : ℂ => (((z + μ).im ^ 2 : ℝ) : ℂ) *
      (z + μ) ^ p * conj (z + μ) ^ q *
        (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ)) =
      fun z => (2 * f₁ z - f₂ z - f₃ z) / 4 := by
    funext z
    rw [ofReal_im_sq_eq_wick_polynomial]
    dsimp [f₁, f₂, f₃]
    simp only [pow_add, pow_one, pow_two]
    ring
  rw [h]
  exact (((hf₁.const_mul 2).sub hf₂).sub hf₃).div_const 4

/-- A finite polynomial with an imaginary-square insertion integrates to a
finite sum of exact shifted moments. -/
theorem integral_imSq_shifted_polynomial (P : CPoly) (μ : ℂ)
    {rate : ℝ} (hrate : 0 < rate) :
    (∫ z : ℂ, (((z + μ).im ^ 2 : ℝ) : ℂ) * ev (z + μ) P *
      (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ) ∂gaussC) =
      ∑ k ∈ P.support, P.coeff k * imSqMoment rate μ (k 0) (k 1) := by
  have h : (fun z : ℂ => (((z + μ).im ^ 2 : ℝ) : ℂ) * ev (z + μ) P *
      (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ)) =
      fun z => ∑ k ∈ P.support, P.coeff k *
        ((((z + μ).im ^ 2 : ℝ) : ℂ) * (z + μ) ^ (k 0) * conj (z + μ) ^ (k 1) *
          (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ)) := by
    funext z
    rw [ev_eq_sum_monomials]
    simp only [Finset.mul_sum, Finset.sum_mul]
    apply Finset.sum_congr rfl
    intro k hk
    ring
  rw [h, integral_finsetSum _ (fun k _ =>
    (integrable_imSq_shifted_monomial (k 0) (k 1) μ hrate).const_mul (P.coeff k))]
  apply Finset.sum_congr rfl
  intro k hk
  rw [integral_const_mul, integral_shifted_im_sq_monomial_damped (k 0) (k 1) μ hrate]
  rfl

/-- The production phase polynomial from `q0_source_affine_phase_real` is
exactly a finite sum of shifted Gaussian Wick moments after translating the
second coordinate. -/
theorem integral_q0_phase_imSq_wick (r : ℝ) (μ : ℂ)
    {rate : ℝ} (hrate : 0 < rate) :
    let P := phaseInvariantSlice phaseTerms (r : ℂ)
    (∫ z : ℂ, (((z + μ).im ^ 2 : ℝ) : ℂ) *
      (Sphase (Complex.normSq (r : ℂ)) (Complex.normSq (z + μ))
        (conj (r : ℂ) * (z + μ)).re : ℂ) *
      (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ) ∂gaussC) =
        ∑ k ∈ P.support, P.coeff k * imSqMoment rate μ (k 0) (k 1) := by
  dsimp only
  have h (z : ℂ) :
      ev (z + μ) (phaseInvariantSlice phaseTerms (r : ℂ)) =
        (Sphase (Complex.normSq (r : ℂ)) (Complex.normSq (z + μ))
          (conj (r : ℂ) * (z + μ)).re : ℂ) := by
    simpa only [Sphase, Ssum] using ev_phaseInvariantSlice phaseTerms (r : ℂ) (z + μ)
  simpa only [h] using
    integral_imSq_shifted_polynomial (phaseInvariantSlice phaseTerms (r : ℂ)) μ hrate

end
end Grothe.UpperChaos.Q0PhaseWickBridge
