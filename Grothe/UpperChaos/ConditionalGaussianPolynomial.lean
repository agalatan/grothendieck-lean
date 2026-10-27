import Grothe.UpperChaos.ConditionalGaussianPhase
import Grothe.UpperChaos.ComplexHermite

/-!
# Exact conditional integration of complex polynomials

The existing `CPoly` represents a finite polynomial in a complex coordinate
and its conjugate. Evaluation of the affine phase kernel is a finite sum of
shifted Wick moments, retaining the inverse-rate mass of the Gaussian tilt.
Only the radial rate and the auxiliary Laplace parameter must be positive;
the real affine coefficient is arbitrary, including zero.

Agent-ID: codex-1456
-/

open MeasureTheory Grothe.LowerAnalytic Grothe.Haag
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

/-- Evaluate the canonical complex polynomial by its finite monomial support. -/
theorem ev_eq_sum_monomials (P : CPoly) (w : ℂ) :
    ev w P = ∑ s ∈ P.support, P.coeff s * w ^ s 0 * conj w ^ s 1 := by
  classical
  simp only [ev, MvPolynomial.eval_eq', Fin.prod_univ_two, zv,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_fin_one, mul_assoc]

private theorem ev_mul_affine_phaseLaplace (P : CPoly) (α a t : ℝ) (z : ℂ) :
    (fun w : ℂ => ev w P * phaseLaplaceKernel (z + (a : ℂ) * w) t *
      (Real.exp (-(α - 1) * Complex.normSq w) : ℂ)) =
      fun w : ℂ => ∑ s ∈ P.support, P.coeff s *
        (w ^ s 0 * conj w ^ s 1 * phaseLaplaceKernel (z + (a : ℂ) * w) t *
          (Real.exp (-(α - 1) * Complex.normSq w) : ℂ)) := by
  classical
  funext w
  simp only [ev_eq_sum_monomials, Finset.sum_mul]
  refine Finset.sum_congr rfl (fun s _ => ?_)
  ring

/-- Every finite complex polynomial times the affine phase kernel is integrable. -/
theorem integrable_affine_phaseLaplace_polynomial (P : CPoly)
    (α a t : ℝ) (z : ℂ) (hα : 0 < α) (ht : 0 < t) :
    Integrable (fun w : ℂ => ev w P * phaseLaplaceKernel (z + (a : ℂ) * w) t *
      (Real.exp (-(α - 1) * Complex.normSq w) : ℂ)) gaussC := by
  rw [ev_mul_affine_phaseLaplace]
  exact integrable_finsetSum _ (fun s _ =>
    (integrable_affine_phaseLaplace_monomial (s 0) (s 1) α a t z hα ht).const_mul (P.coeff s))

/-- Exact conditional integration is a finite linear combination of shifted Wick moments. -/
theorem integral_affine_phaseLaplace_polynomial (P : CPoly)
    (α a t : ℝ) (z : ℂ) (hα : 0 < α) (ht : 0 < t) :
    let β : ℝ := α + a ^ 2 * t
    let μ : ℂ := -((a * t / β : ℝ) : ℂ) * z
    (∫ w, ev w P * phaseLaplaceKernel (z + (a : ℂ) * w) t *
      (Real.exp (-(α - 1) * Complex.normSq w) : ℂ) ∂gaussC) =
      ((t ^ (-(1 / 2 : ℝ)) * Real.exp (-(α * t * Complex.normSq z / β)) : ℝ) : ℂ) *
        ∑ s ∈ P.support, P.coeff s *
          (z * shiftedDampedMoment β μ (s 0) (s 1) +
            (a : ℂ) * shiftedDampedMoment β μ (s 0 + 1) (s 1)) := by
  dsimp only
  rw [ev_mul_affine_phaseLaplace,
    integral_finsetSum _ (fun s _ =>
      (integrable_affine_phaseLaplace_monomial (s 0) (s 1) α a t z hα ht).const_mul (P.coeff s)),
    Finset.mul_sum]
  refine Finset.sum_congr rfl (fun s _ => ?_)
  rw [integral_const_mul, integral_affine_phaseLaplace_monomial (s 0) (s 1) α a t z hα ht]
  ring

end
end Grothe.UpperChaos
