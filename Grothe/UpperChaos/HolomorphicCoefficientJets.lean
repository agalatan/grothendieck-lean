import Grothe.UpperChaos.ActualSourceCoefficientExtraction
import Mathlib.Analysis.Calculus.IteratedDeriv.Lemmas
import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Tactic.FunProp
import Mathlib.Tactic.Ring

/-!
# Finite holomorphic jets and Gaussian coefficient extraction

Agent-ID: codex-2ca4.

Finite Leibniz differentiation identifies the jet of a monomial times a
smooth function at zero. For a holomorphic exponential, the resulting
falling factorial is exactly the already-proved Gaussian mixed moment.
Finite polynomial versions follow by finite sums on both sides.

No infinite series, physical/source Fubini, derivative-under-integral rule,
or coefficient-identification hypothesis is used here.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.HolomorphicCoefficientJets

open ActualSourceCoefficientExtraction

noncomputable section

/-- At zero, the finite Leibniz formula for `z^p * F z` has only one possible
nonzero term. The falling factorial also handles the case `q < p`. -/
theorem iteratedDeriv_monomial_mul_zero (p q : ℕ) {F : ℂ → ℂ}
    (hF : ContDiffAt ℂ q F 0) :
    iteratedDeriv q (fun z : ℂ => z ^ p * F z) 0 =
      (q.descFactorial p : ℂ) * iteratedDeriv (q - p) F 0 := by
  rw [iteratedDeriv_fun_mul (by fun_prop) hF]
  simp only [iteratedDeriv_fun_pow_zero]
  rw [Finset.sum_eq_single p]
  · simp only [if_pos rfl]
    rw [Nat.descFactorial_eq_factorial_mul_choose, Nat.cast_mul]
    ring
  · intro i hi hip
    simp only [if_neg hip, mul_zero, zero_mul]
  · intro hp
    have hqp : q < p := lt_of_lt_of_le (Nat.lt_succ_self q)
      (by simpa only [Finset.mem_range, not_lt] using hp)
    simp [Nat.choose_eq_zero_of_lt hqp]

/-- Explicit-function interface for finite zero-jet product comparisons. -/
theorem iteratedDeriv_pow_mul_zero (p q : ℕ) (F : ℂ → ℂ)
    (hF : ContDiffAt ℂ q F 0) :
    iteratedDeriv q (fun z : ℂ => z ^ p * F z) 0 =
      (q.descFactorial p : ℂ) * iteratedDeriv (q - p) F 0 :=
  iteratedDeriv_monomial_mul_zero p q hF

/-- The scalar holomorphic exponential jet, including all zero-degree cases. -/
theorem iteratedDeriv_monomial_cexp_zero (a : ℂ) (p q : ℕ) :
    iteratedDeriv q (fun z : ℂ => z ^ p * Complex.exp (a * z)) 0 =
      (q.descFactorial p : ℂ) * a ^ (q - p) := by
  rw [iteratedDeriv_monomial_mul_zero p q (by fun_prop),
    iteratedDeriv_cexp_const_mul]
  simp only [mul_zero, Complex.exp_zero, mul_one]

/-- The existing exact Gaussian mixed moment equals a finite derivative.
This identifies two already-evaluated scalars; no integral is differentiated. -/
theorem integral_holomorphic_mixed_eq_jet (a : ℂ) (p q : ℕ) :
    (∫ z : ℂ, z ^ p * conj z ^ q * Complex.exp (a * z) ∂gaussC) =
      iteratedDeriv q (fun z : ℂ => z ^ p * Complex.exp (a * z)) 0 := by
  rw [integral_holomorphic_mixed, iteratedDeriv_monomial_cexp_zero]

/-- The finite-polynomial Leibniz identity with an arbitrary sufficiently
smooth holomorphic factor. Only its ordinary local differentiability is assumed. -/
theorem iteratedDeriv_finite_polynomial_mul_zero {ι : Type*} (t : Finset ι)
    (c : ι → ℂ) (p : ι → ℕ) (q : ℕ) {F : ℂ → ℂ}
    (hF : ContDiffAt ℂ q F 0) :
    iteratedDeriv q (fun z : ℂ => (∑ i ∈ t, c i * z ^ p i) * F z) 0 =
      ∑ i ∈ t, c i * ((q.descFactorial (p i) : ℂ) *
        iteratedDeriv (q - p i) F 0) := by
  classical
  simp_rw [Finset.sum_mul, mul_assoc]
  have hs (i : ι) (_hi : i ∈ t) :
      ContDiffAt ℂ q (fun z : ℂ => c i * (z ^ p i * F z)) 0 := by
    fun_prop
  rw [iteratedDeriv_fun_sum hs]
  apply Finset.sum_congr rfl
  intro i hi
  rw [iteratedDeriv_const_mul_field, iteratedDeriv_monomial_mul_zero (p i) q hF]

/-- A finite holomorphic polynomial times the exponential has an explicit
finite jet, with the same coefficients as Gaussian extraction. -/
theorem iteratedDeriv_finite_polynomial_cexp_zero {ι : Type*} (t : Finset ι)
    (c : ι → ℂ) (p : ι → ℕ) (a : ℂ) (q : ℕ) :
    iteratedDeriv q (fun z : ℂ =>
      (∑ i ∈ t, c i * z ^ p i) * Complex.exp (a * z)) 0 =
      ∑ i ∈ t, c i * ((q.descFactorial (p i) : ℂ) * a ^ (q - p i)) := by
  rw [iteratedDeriv_finite_polynomial_mul_zero t c p q (by fun_prop)]
  simp only [iteratedDeriv_cexp_const_mul, mul_zero, Complex.exp_zero, mul_one]

/-- Absolute integrability of every finite polynomial coefficient pairing. -/
theorem integrable_finite_polynomial_holomorphic_mixed {ι : Type*} (t : Finset ι)
    (c : ι → ℂ) (p : ι → ℕ) (a : ℂ) (q : ℕ) :
    Integrable (fun z : ℂ =>
      (∑ i ∈ t, c i * z ^ p i) * conj z ^ q * Complex.exp (a * z)) gaussC := by
  have h := integrable_finsetSum t fun i _ =>
    (integrable_holomorphic_mixed a (p i) q).const_mul (c i)
  refine h.congr (Filter.Eventually.of_forall fun z => ?_)
  simp only [Finset.sum_mul, mul_assoc]

/-- Gaussian extraction of an arbitrary finite holomorphic polynomial equals
its finite jet after multiplication by the holomorphic exponential. -/
theorem integral_finite_polynomial_holomorphic_eq_jet {ι : Type*} (t : Finset ι)
    (c : ι → ℂ) (p : ι → ℕ) (a : ℂ) (q : ℕ) :
    (∫ z : ℂ, (∑ i ∈ t, c i * z ^ p i) * conj z ^ q *
      Complex.exp (a * z) ∂gaussC) =
      iteratedDeriv q (fun z : ℂ =>
        (∑ i ∈ t, c i * z ^ p i) * Complex.exp (a * z)) 0 := by
  classical
  have hp (z : ℂ) :
      (∑ i ∈ t, c i * z ^ p i) * conj z ^ q * Complex.exp (a * z) =
        ∑ i ∈ t, c i * (z ^ p i * conj z ^ q * Complex.exp (a * z)) := by
    simp only [Finset.sum_mul, mul_assoc]
  simp_rw [hp]
  rw [integral_finsetSum t fun i _ =>
    (integrable_holomorphic_mixed a (p i) q).const_mul (c i)]
  simp only [integral_const_mul, integral_holomorphic_mixed,
    iteratedDeriv_finite_polynomial_cexp_zero]

private theorem eval_eq_support (P : Polynomial ℂ) (z : ℂ) :
    P.eval z = ∑ p ∈ P.support, P.coeff p * z ^ p := by
  rw [Polynomial.eval_eq_sum, Polynomial.sum_def]

/-- The same finite Leibniz identity for a bundled univariate polynomial. -/
theorem iteratedDeriv_polynomial_mul_zero (P : Polynomial ℂ) (q : ℕ) {F : ℂ → ℂ}
    (hF : ContDiffAt ℂ q F 0) :
    iteratedDeriv q (fun z : ℂ => P.eval z * F z) 0 =
      ∑ p ∈ P.support, P.coeff p * ((q.descFactorial p : ℂ) *
        iteratedDeriv (q - p) F 0) := by
  simp_rw [eval_eq_support]
  exact iteratedDeriv_finite_polynomial_mul_zero P.support P.coeff (fun p => p) q hF

/-- The univariate-polynomial Gaussian pairing is absolutely integrable. -/
theorem integrable_polynomial_holomorphic_mixed (P : Polynomial ℂ) (a : ℂ) (q : ℕ) :
    Integrable (fun z : ℂ => P.eval z * conj z ^ q * Complex.exp (a * z)) gaussC := by
  simp_rw [eval_eq_support]
  exact integrable_finite_polynomial_holomorphic_mixed
    P.support P.coeff (fun p => p) a q

/-- Bundled univariate-polynomial coefficient versus jet equality. -/
theorem integral_polynomial_holomorphic_eq_jet (P : Polynomial ℂ) (a : ℂ) (q : ℕ) :
    (∫ z : ℂ, P.eval z * conj z ^ q * Complex.exp (a * z) ∂gaussC) =
      iteratedDeriv q (fun z : ℂ => P.eval z * Complex.exp (a * z)) 0 := by
  simp_rw [eval_eq_support]
  exact integral_finite_polynomial_holomorphic_eq_jet
    P.support P.coeff (fun p => p) a q

end
end Grothe.UpperChaos.HolomorphicCoefficientJets
