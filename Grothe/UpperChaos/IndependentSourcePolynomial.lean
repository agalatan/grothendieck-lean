import Grothe.UpperChaos.IndependentSourceMoments
import Mathlib.Analysis.Calculus.Deriv.Polynomial

/-!
# A finite polynomial evaluator for independent-source Gaussian moments

Agent-ID: codex-2ca4.

For fixed second source b, the first-source polynomial starts at
`(a / rate)^q`. Each z insertion applies `derivative + (b/rate)` to this
polynomial. This gives a finite canonical evaluator for every pair p,q,
without a separate binomial-coefficient induction or an assumed source identity.

The prefactor `exp(a*b/rate)/rate` is retained. All uses of differentiation
under the integral rely on the preceding source-uniform domination theorem.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.IndependentSourcePolynomial

open IndependentSourceMoments

noncomputable section

/-- A finite polynomial in the first source. Its coefficients depend on the
second source and the inverse radial rate. -/
def momentPolynomial (rate : ℝ) (b : ℂ) : ℕ → ℕ → Polynomial ℂ
  | 0, q => Polynomial.C ((rate : ℂ)⁻¹) ^ q * Polynomial.X ^ q
  | p + 1, q =>
      (momentPolynomial rate b p q).derivative +
        Polynomial.C (b / (rate : ℂ)) * momentPolynomial rate b p q

/-- Evaluation of the starting polynomial is the qth conjugate-source mean. -/
theorem eval_momentPolynomial_zero (rate : ℝ) (a b : ℂ) (q : ℕ) :
    (momentPolynomial rate b 0 q).eval a = (a / (rate : ℂ)) ^ q := by
  simp only [momentPolynomial, Polynomial.eval_mul, Polynomial.eval_pow,
    Polynomial.eval_C, Polynomial.eval_X, div_eq_mul_inv, mul_pow]
  ring

/-- Each further insertion is one exact polynomial derivative plus multiplication. -/
theorem eval_momentPolynomial_succ (rate : ℝ) (a b : ℂ) (p q : ℕ) :
    (momentPolynomial rate b (p + 1) q).eval a =
      (momentPolynomial rate b p q).derivative.eval a +
        (b / (rate : ℂ)) * (momentPolynomial rate b p q).eval a := by
  simp only [momentPolynomial, Polynomial.eval_add, Polynomial.eval_mul,
    Polynomial.eval_C]

/-- The complete finite scalar evaluator, including its Gaussian normalization. -/
def momentValue (rate : ℝ) (a b : ℂ) (p q : ℕ) : ℂ :=
  (rate : ℂ)⁻¹ * Complex.exp (a * b / (rate : ℂ)) *
    (momentPolynomial rate b p q).eval a

/-- Repeated differentiation in b evaluates all pure conjugate insertions. -/
theorem integral_zero_right (q : ℕ) {rate : ℝ} (hrate : 0 < rate) (a b : ℂ) :
    (∫ z, integrand rate a b 0 q z ∂gaussC) =
      (rate : ℂ)⁻¹ * Complex.exp (a * b / (rate : ℂ)) * (a / (rate : ℂ)) ^ q := by
  induction q generalizing b with
  | zero => simpa only [pow_zero, mul_one] using integral_zero hrate a b
  | succ q ih =>
    have hd := hasDerivAt_integral_b 0 q hrate a b
    have he : (fun t : ℂ => ∫ z, integrand rate a t 0 q z ∂gaussC) =
        (fun t : ℂ => (rate : ℂ)⁻¹ * Complex.exp (a * t / (rate : ℂ)) *
          (a / (rate : ℂ)) ^ q) := funext ih
    rw [he] at hd
    have harg : HasDerivAt (fun t : ℂ => a * t / (rate : ℂ))
        (a / (rate : ℂ)) b := by
      simpa only [mul_one] using
        (HasDerivAt.const_mul a (hasDerivAt_id b)).div_const (rate : ℂ)
    have hformula := (HasDerivAt.const_mul (rate : ℂ)⁻¹ harg.cexp).mul_const
      ((a / (rate : ℂ)) ^ q)
    calc
      _ = ((rate : ℂ)⁻¹ *
          (Complex.exp (a * b / (rate : ℂ)) * (a / (rate : ℂ)))) *
          (a / (rate : ℂ)) ^ q := hd.unique hformula
      _ = _ := by rw [pow_succ]; ring

/-- Every independent-source mixed moment is evaluated by the finite polynomial
recurrence. The only analytic hypothesis is a positive radial rate. -/
theorem integral_eq_polynomial (p q : ℕ) {rate : ℝ}
    (hrate : 0 < rate) (a b : ℂ) :
    (∫ z, integrand rate a b p q z ∂gaussC) =
      (rate : ℂ)⁻¹ * Complex.exp (a * b / (rate : ℂ)) *
        (momentPolynomial rate b p q).eval a := by
  induction p generalizing a with
  | zero =>
    rw [eval_momentPolynomial_zero]
    exact integral_zero_right q hrate a b
  | succ p ih =>
    have hd := hasDerivAt_integral_a p q hrate a b
    have he : (fun t : ℂ => ∫ z, integrand rate t b p q z ∂gaussC) =
        (fun t : ℂ => (rate : ℂ)⁻¹ * Complex.exp (t * b / (rate : ℂ)) *
          (momentPolynomial rate b p q).eval t) := funext ih
    rw [he] at hd
    have harg : HasDerivAt (fun t : ℂ => t * b / (rate : ℂ))
        (b / (rate : ℂ)) a := by
      simpa only [one_mul] using ((hasDerivAt_id a).mul_const b).div_const (rate : ℂ)
    have hformula := (HasDerivAt.const_mul (rate : ℂ)⁻¹ harg.cexp).mul
      ((momentPolynomial rate b p q).hasDerivAt a)
    calc
      _ = ((rate : ℂ)⁻¹ *
          (Complex.exp (a * b / (rate : ℂ)) * (b / (rate : ℂ)))) *
            (momentPolynomial rate b p q).eval a +
          ((rate : ℂ)⁻¹ * Complex.exp (a * b / (rate : ℂ))) *
            (momentPolynomial rate b p q).derivative.eval a := hd.unique hformula
      _ = _ := by rw [eval_momentPolynomial_succ]; ring

/-- A named evaluator form of the same exact moment formula. -/
theorem integral_eq_momentValue (p q : ℕ) {rate : ℝ}
    (hrate : 0 < rate) (a b : ℂ) :
    (∫ z, integrand rate a b p q z ∂gaussC) = momentValue rate a b p q :=
  integral_eq_polynomial p q hrate a b

/-- Finite polynomial integration is the finite coefficient-weighted evaluator.
Every summand is absolutely integrable by the independent-source majorant. -/
theorem integral_finite_polynomial {ι : Type*} (t : Finset ι)
    (c : ι → ℂ) (p q : ι → ℕ) {rate : ℝ} (hrate : 0 < rate) (a b : ℂ) :
    (∫ z : ℂ, ∑ i ∈ t, c i * integrand rate a b (p i) (q i) z ∂gaussC) =
      ∑ i ∈ t, c i * momentValue rate a b (p i) (q i) := by
  rw [integral_finsetSum t fun i _ =>
    (integrable_integrand (p i) (q i) hrate a b).const_mul (c i)]
  apply Finset.sum_congr rfl
  intro i hi
  rw [integral_const_mul, integral_eq_momentValue (p i) (q i) hrate a b]

/-- The conventional factored polynomial integrand has the same finite evaluation. -/
theorem integral_finite_mixed_polynomial {ι : Type*} (t : Finset ι)
    (c : ι → ℂ) (p q : ι → ℕ) {rate : ℝ} (hrate : 0 < rate) (a b : ℂ) :
    (∫ z : ℂ, (∑ i ∈ t, c i * (z ^ p i * conj z ^ q i)) *
      Complex.exp (-((rate - 1 : ℝ) : ℂ) * (Complex.normSq z : ℂ) +
        a * z + b * conj z) ∂gaussC) =
      ∑ i ∈ t, c i * momentValue rate a b (p i) (q i) := by
  have hpoint (z : ℂ) :
      (∑ i ∈ t, c i * (z ^ p i * conj z ^ q i)) *
          Complex.exp (-((rate - 1 : ℝ) : ℂ) * (Complex.normSq z : ℂ) +
            a * z + b * conj z) =
        ∑ i ∈ t, c i * integrand rate a b (p i) (q i) z := by
    simp only [integrand, Finset.sum_mul, mul_assoc]
  simp_rw [hpoint]
  exact integral_finite_polynomial t c p q hrate a b

end
end Grothe.UpperChaos.IndependentSourcePolynomial
