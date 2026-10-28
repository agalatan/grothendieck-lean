import Grothe.UpperChaos.RationalWickCompiler
import Grothe.UpperChaos.RationalUnitTaylorSource
import Grothe.UpperChaos.ConditionalGaussianPolynomial

/-!
# Integrating rational four-variable source polynomials

This bridge expands the original four-variable support before integration,
so it does not identify that support with the potentially smaller support of
a specialized complex slice. No source normalization or numerical bound is
assumed.

Agent-ID: codex-8c4d
-/

open MeasureTheory MvPolynomial Grothe.LowerAnalytic Grothe.Haag
open scoped ComplexConjugate

namespace Grothe.UpperChaos.RationalWickIntegralBridge

open Grothe.UpperChaos.RationalPhaseInvariant
open Grothe.UpperChaos.RationalWickMonomial
open Grothe.UpperChaos.RationalWickCompiler

noncomputable section

/-- At a real first coordinate, evaluation expands over the *original*
four-variable rational support. -/
theorem evalQ_real_support (P : RatPoly4) (r : ℝ) (w : ℂ) :
    evalQ (r : ℂ) w P =
      ∑ d ∈ P.support, (P.coeff d : ℂ) * (r : ℂ) ^ (d 0 + d 1) *
        w ^ d 2 * conj w ^ d 3 := by
  simp only [evalQ, coe_eval₂Hom, MvPolynomial.eval₂_eq', Fin.prod_univ_four]
  apply Finset.sum_congr rfl
  intro d hd
  simp [pow_add, mul_assoc]

/-- The affine Gaussian integral of any rational four-variable source is
the existing rational Wick compiler, including the Gaussian mass and kernel
factors. Only positive analytic rate and auxiliary scale are required. -/
theorem integral_evalQ_eq_wickCompile (P : RatPoly4) (r α κ t : ℝ)
    (hα : 0 < α) (ht : 0 < t) :
    (∫ w : ℂ, evalQ (r : ℂ) w P *
      phaseLaplaceKernel ((r : ℂ) + (κ : ℂ) * w) t *
        (Real.exp (-(α - 1) * Complex.normSq w) : ℂ) ∂gaussC) =
      ((t ^ (-(1 / 2 : ℝ)) *
          Real.exp (-(α * t * Complex.normSq (r : ℂ) / (α + κ ^ 2 * t))) : ℝ) : ℂ) *
        (evalWickQ r (α + κ ^ 2 * t)⁻¹ (κ * t / (α + κ ^ 2 * t)) κ
          (wickCompileQ P) : ℂ) := by
  have hfun : (fun w : ℂ => evalQ (r : ℂ) w P *
      phaseLaplaceKernel ((r : ℂ) + (κ : ℂ) * w) t *
        (Real.exp (-(α - 1) * Complex.normSq w) : ℂ)) =
      fun w : ℂ => ∑ d ∈ P.support,
        ((P.coeff d : ℂ) * (r : ℂ) ^ (d 0 + d 1)) *
          (w ^ d 2 * conj w ^ d 3 *
            phaseLaplaceKernel ((r : ℂ) + (κ : ℂ) * w) t *
              (Real.exp (-(α - 1) * Complex.normSq w) : ℂ)) := by
    funext w
    rw [evalQ_real_support]
    simp only [Finset.sum_mul]
    apply Finset.sum_congr rfl
    intro d hd
    ring
  rw [hfun, integral_finsetSum _ (fun d _ =>
    (integrable_affine_phaseLaplace_monomial (d 2) (d 3) α κ t (r : ℂ) hα ht).const_mul
      ((P.coeff d : ℂ) * (r : ℂ) ^ (d 0 + d 1)))]
  rw [eval_wickCompileQ, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro d hd
  rw [integral_const_mul, integral_affine_phaseLaplace_monomial (d 2) (d 3) α κ t (r : ℂ) hα ht]
  have hμ : -((κ * t / (α + κ ^ 2 * t) : ℝ) : ℂ) * (r : ℂ) =
      ((-(κ * t / (α + κ ^ 2 * t) * r) : ℝ) : ℂ) := by
    push_cast
    ring
  rw [hμ]
  ring

end
end Grothe.UpperChaos.RationalWickIntegralBridge
