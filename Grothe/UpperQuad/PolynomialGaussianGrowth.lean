import Grothe.UpperQuad.GaussianMehlerBound
import Grothe.UpperQuad.PolynomialHermiteNorm
import Grothe.UpperQuad.PolynomialRescale

/-!
# Complex growth of a polynomial times a Gaussian

A degree-`N` polynomial bounded by `exp(ε |z|²)` on the real Gaussian plane has an
explicit bound after complexification and multiplication by the entire Gaussian.
The bound depends on imaginary coordinates only. This is the analytic ingredient for
estimating the phase on complex quadrature contours; it is not a quadrature certificate.

Agent-ID: codex-1a87. Refs #339, #334.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.PolynomialGaussianGrowth

open Complex MvPolynomial Grothe.UpperChaos
open GaussianMehlerBound PolynomialHermite PolynomialRescale

noncomputable section

/-- Rescaling at the cancellation rate brings polynomial growth below the Gaussian threshold. -/
lemma norm_rescale_le (P : CPoly) {ε τ : ℝ} (hε : 0 < ε) (hτ0 : 0 < τ)
    (hbound : ∀ z : ℂ, ‖ev z P‖ ≤ Real.exp (ε * normSq z)) (z : ℂ) :
    ‖ev z (rescale (Real.sqrt (gaussianRate ε τ)) P)‖ ≤
      Real.exp (ε / gaussianRate ε τ * normSq z) := by
  rw [ev_rescale]
  convert hbound ((Real.sqrt (gaussianRate ε τ) : ℂ)⁻¹ * z) using 1
  congr 1
  rw [normSq_mul, normSq_inv, normSq_ofReal,
    Real.mul_self_sqrt (gaussianRate_pos hε hτ0).le]
  ring

/-- Squared complex growth bound for every degree-bounded polynomial with Gaussian growth. -/
theorem norm_damped_eval_sq_le (P : CPoly) {N : ℕ} (hP : P.totalDegree ≤ N)
    {ε τ : ℝ} (hε : 0 < ε) (hτ0 : 0 < τ) (hτ1 : τ < 1)
    (hbound : ∀ z : ℂ, ‖ev z P‖ ≤ Real.exp (ε * normSq z)) (r x : ℂ) :
    ‖eval ![r + I * x, r - I * x] P *
        Complex.exp (-((ε : ℂ) * (r ^ 2 + x ^ 2)))‖ ^ 2 ≤
      (τ ^ N)⁻¹ * ((1 - τ) ^ 2)⁻¹ *
        Real.exp (4 * ε / (1 - τ) * (r.im ^ 2 + x.im ^ 2)) := by
  let Q := rescale (Real.sqrt (gaussianRate ε τ)) P
  have hQ : Q.totalDegree ≤ N := (totalDegree_rescale_le _ P).trans hP
  have hnorm : ‖polynomialLp Q‖ ^ 2 ≤ (1 - 2 * (ε / gaussianRate ε τ))⁻¹ :=
    GaussianGrowth.norm_sq_le_of_exp_bound (memLp_ev Q)
      (damping_ratio_lt_half hε hτ0 hτ1) (norm_rescale_le P hε hτ0 hbound)
  have hrate := gaussianRate_pos hε hτ0
  have hsqrt : Real.sqrt (gaussianRate ε τ) ≠ 0 := (Real.sqrt_pos.2 hrate).ne'
  have heval := norm_eval_sq_le Q hQ τ hτ0 hτ1
    ((Real.sqrt (gaussianRate ε τ) : ℂ) * (r + I * x))
    ((Real.sqrt (gaussianRate ε τ) : ℂ) * (r - I * x))
  have hrecovery : eval ![(Real.sqrt (gaussianRate ε τ) : ℂ) * (r + I * x),
      (Real.sqrt (gaussianRate ε τ) : ℂ) * (r - I * x)] Q =
        eval ![r + I * x, r - I * x] P :=
    eval_rescale_scaled_pair _ hsqrt P _ _
  rw [hrecovery] at heval
  apply norm_damped_sq_le_of_mehler hε hτ0 hτ1 N r x
  refine heval.trans (mul_le_mul_of_nonneg_right hnorm ?_)
  have hsq : 0 < 1 - τ ^ 2 := by nlinarith
  positivity

end

end Grothe.UpperQuad.PolynomialGaussianGrowth
