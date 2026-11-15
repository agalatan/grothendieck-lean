import Grothe.UpperChaos.QuadraticPolynomialIntegrability
import Grothe.UpperChaos.LinearTiltedMoments

/-!
# Finite mixed moments at the exact quadratic Schur threshold

Agent-ID: codex-2ca4.

The first-coordinate mean is `-(B/A)*w`; the remaining Gaussian rate is
`(A*C-B^2)/A`. Genuine joint polynomial integrability justifies Fubini before
the first coordinate is evaluated. Expanding the finite shifted Wick sum
then leaves ordinary damped moments in the second coordinate.

All formulas use the existing `quadraticWeight` relative to two independent
standard complex Gaussians. The zeroth moment therefore has mass
`1/(A*C-B^2)`. No stronger Schur hypothesis, numerical estimate, or historical
operator/Fock identification is assumed.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.QuadraticPolynomialMoments

open WeightedHSMass LinearTiltedMoments

noncomputable section

/-- Coefficient of the outer monomial after one shifted Wick contraction. -/
def wickCoeff (A B : ℝ) (p q k : ℕ) : ℂ :=
  (p.choose k : ℂ) * (q.choose k : ℂ) *
    (-((B / A : ℝ) : ℂ)) ^ ((p - k) + (q - k)) *
      (k.factorial : ℂ) / (A : ℂ) ^ (k + 1)

/-- A finite scalar evaluator for the full two-complex-variable integral.
Each surviving outer monomial is evaluated at the exact Schur rate. -/
def momentValue (A B C : ℝ) (p q r s : ℕ) : ℂ :=
  ∑ k ∈ Finset.range (min p q + 1), wickCoeff A B p q k *
    (if (p - k) + r = (q - k) + s then
      (((p - k) + r).factorial : ℂ) /
        (((A * C - B ^ 2) / A : ℝ) : ℂ) ^ (((p - k) + r) + 1)
    else 0)

private theorem quadraticWeight_factor (A B C : ℝ) (z w : ℂ) :
    quadraticWeight A B C (z, w) =
      Real.exp (-(C - 1) * Complex.normSq w) *
        Real.exp (-(A - 1) * Complex.normSq z +
          2 * ((-(B : ℂ) * conj w) * z).re) := by
  rw [quadraticWeight, ← Real.exp_add]
  congr 1
  simp only [Complex.mul_re, Complex.mul_im, Complex.neg_re, Complex.neg_im,
    Complex.ofReal_re, Complex.ofReal_im, Complex.conj_re, Complex.conj_im]
  ring

private theorem monomial_factor (p q r s : ℕ) (A B C : ℝ) (z w : ℂ) :
    (z ^ p * conj z ^ q) * (w ^ r * conj w ^ s) *
        (quadraticWeight A B C (z, w) : ℂ) =
      ((w ^ r * conj w ^ s) * (Real.exp (-(C - 1) * Complex.normSq w) : ℂ)) *
        (z ^ p * conj z ^ q *
          (Real.exp (-(A - 1) * Complex.normSq z +
            2 * ((-(B : ℂ) * conj w) * z).re) : ℂ)) := by
  rw [quadraticWeight_factor, Complex.ofReal_mul]
  ring

private theorem mean_source (A B : ℝ) (w : ℂ) :
    mean A (-(B : ℂ) * conj w) = -((B / A : ℝ) : ℂ) * w := by
  apply Complex.ext <;>
    simp only [mean, Complex.mul_re, Complex.mul_im, Complex.conj_re,
      Complex.conj_im, Complex.neg_re, Complex.neg_im, Complex.ofReal_re,
      Complex.ofReal_im, div_eq_mul_inv] <;> ring

private theorem normSq_source (B : ℝ) (w : ℂ) :
    Complex.normSq (-(B : ℂ) * conj w) = B ^ 2 * Complex.normSq w := by
  rw [Complex.normSq_mul, Complex.normSq_neg, Complex.normSq_ofReal,
    Complex.normSq_conj]
  ring

private theorem exp_product_eq {A : ℝ} (hA : 0 < A) (B C : ℝ) (w : ℂ) :
    Real.exp (-(C - 1) * Complex.normSq w) *
        Real.exp (Complex.normSq (-(B : ℂ) * conj w) / A) =
      Real.exp (-((A * C - B ^ 2) / A - 1) * Complex.normSq w) := by
  rw [normSq_source, ← Real.exp_add]
  congr 1
  field_simp [hA.ne']
  ring

/-- The conditional polynomial integral exists for every fixed second
coordinate; positivity of the first pivot is sufficient for this step. -/
theorem integrable_mixed_monomial_inner (p q r s : ℕ) {A : ℝ}
    (hA : 0 < A) (B C : ℝ) (w : ℂ) :
    Integrable (fun z : ℂ =>
      (z ^ p * conj z ^ q) * (w ^ r * conj w ^ s) *
        (quadraticWeight A B C (z, w) : ℂ)) gaussC := by
  simp_rw [monomial_factor]
  exact (LinearTiltedMoments.integrable_mixed_moment p q hA
    (-(B : ℂ) * conj w)).const_mul _

/-- First-coordinate integration is a finite shifted Wick moment times the
remaining Schur-rate density. No inverse-rate mass is dropped. -/
theorem integral_mixed_monomial_inner (p q r s : ℕ) {A : ℝ}
    (hA : 0 < A) (B C : ℝ) (w : ℂ) :
    (∫ z : ℂ, (z ^ p * conj z ^ q) * (w ^ r * conj w ^ s) *
      (quadraticWeight A B C (z, w) : ℂ) ∂gaussC) =
      (w ^ r * conj w ^ s) *
        (Real.exp (-((A * C - B ^ 2) / A - 1) * Complex.normSq w) : ℂ) *
          shiftedDampedMoment A (-((B / A : ℝ) : ℂ) * w) p q := by
  simp_rw [monomial_factor]
  rw [integral_const_mul, LinearTiltedMoments.integral_mixed_moment p q hA,
    mean_source]
  have he :
      (Real.exp (-(C - 1) * Complex.normSq w) : ℂ) *
          (Real.exp (Complex.normSq (-(B : ℂ) * conj w) / A) : ℂ) =
        (Real.exp (-((A * C - B ^ 2) / A - 1) * Complex.normSq w) : ℂ) := by
    rw [← Complex.ofReal_mul, exp_product_eq hA B C w]
  calc
    _ = (w ^ r * conj w ^ s) *
        ((Real.exp (-(C - 1) * Complex.normSq w) : ℂ) *
          (Real.exp (Complex.normSq (-(B : ℂ) * conj w) / A) : ℂ)) *
        shiftedDampedMoment A (-((B / A : ℝ) : ℂ) * w) p q := by ring
    _ = _ := by rw [he]

/-- Joint integrability at the original Schur threshold makes the first
conditional evaluation an equality for the complete product integral. -/
theorem integral_mixed_monomial_eq_shifted (p q r s : ℕ) {A B C : ℝ}
    (hA : 0 < A) (hdet : 0 < A * C - B ^ 2) :
    (∫ zw : ℂ × ℂ,
      (zw.1 ^ p * conj zw.1 ^ q) * (zw.2 ^ r * conj zw.2 ^ s) *
        (quadraticWeight A B C zw : ℂ) ∂gaussC.prod gaussC) =
      ∫ w : ℂ, (w ^ r * conj w ^ s) *
        (Real.exp (-((A * C - B ^ 2) / A - 1) * Complex.normSq w) : ℂ) *
          shiftedDampedMoment A (-((B / A : ℝ) : ℂ) * w) p q ∂gaussC := by
  rw [integral_prod_symm _
    (QuadraticPolynomialIntegrability.integrable_mixed_monomial p q r s hA hdet)]
  simp_rw [integral_mixed_monomial_inner p q r s hA B C]

private theorem shifted_product_expansion (A B rate : ℝ) (p q r s : ℕ) (w : ℂ) :
    (w ^ r * conj w ^ s) * (Real.exp (-(rate - 1) * Complex.normSq w) : ℂ) *
        shiftedDampedMoment A (-((B / A : ℝ) : ℂ) * w) p q =
      ∑ k ∈ Finset.range (min p q + 1), wickCoeff A B p q k *
        (w ^ ((p - k) + r) * conj w ^ ((q - k) + s) *
          (Real.exp (-(rate - 1) * Complex.normSq w) : ℂ)) := by
  simp only [shiftedDampedMoment, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k hk
  simp only [wickCoeff, map_mul, map_neg, Complex.conj_ofReal, mul_pow, pow_add]
  ring

/-- Exact finite evaluation of every mixed monomial against the correlated
Gaussian. The hypotheses are exactly the first positive pivot and determinant. -/
theorem integral_mixed_monomial (p q r s : ℕ) {A B C : ℝ}
    (hA : 0 < A) (hdet : 0 < A * C - B ^ 2) :
    (∫ zw : ℂ × ℂ,
      (zw.1 ^ p * conj zw.1 ^ q) * (zw.2 ^ r * conj zw.2 ^ s) *
        (quadraticWeight A B C zw : ℂ) ∂gaussC.prod gaussC) =
      momentValue A B C p q r s := by
  have hrate : 0 < (A * C - B ^ 2) / A := div_pos hdet hA
  rw [integral_mixed_monomial_eq_shifted p q r s hA hdet]
  simp_rw [shifted_product_expansion]
  rw [integral_finsetSum _ fun k _ =>
    (integrable_monomial_damped ((p - k) + r) ((q - k) + s) hrate).const_mul
      (wickCoeff A B p q k)]
  unfold momentValue
  apply Finset.sum_congr rfl
  intro k hk
  rw [integral_const_mul, integral_moment_damped ((p - k) + r) ((q - k) + s) hrate]

/-- The finite evaluator retains the standard-product-Gaussian normalization. -/
theorem momentValue_zero {A B C : ℝ} (hA : 0 < A)
    (hdet : 0 < A * C - B ^ 2) :
    momentValue A B C 0 0 0 0 = (((A * C - B ^ 2)⁻¹ : ℝ) : ℂ) := by
  have h := integral_mixed_monomial 0 0 0 0 hA hdet
  simp only [pow_zero, one_mul] at h
  rw [integral_complex_ofReal, integral_quadraticWeight hA hdet] at h
  exact h.symm

/-- Finite polynomial integration is a finite coefficient-weighted sum of the
explicit scalar evaluator, with joint integrability proved term by term. -/
theorem integral_finite_mixed_polynomial {ι : Type*} (t : Finset ι)
    (c : ι → ℂ) (p q r s : ι → ℕ) {A B C : ℝ}
    (hA : 0 < A) (hdet : 0 < A * C - B ^ 2) :
    (∫ zw : ℂ × ℂ,
      (∑ i ∈ t, c i * ((zw.1 ^ p i * conj zw.1 ^ q i) *
        (zw.2 ^ r i * conj zw.2 ^ s i))) *
          (quadraticWeight A B C zw : ℂ) ∂gaussC.prod gaussC) =
      ∑ i ∈ t, c i * momentValue A B C (p i) (q i) (r i) (s i) := by
  classical
  simp_rw [Finset.sum_mul, mul_assoc]
  rw [integral_finsetSum t fun i _ => by
    simpa only [mul_assoc] using
      (QuadraticPolynomialIntegrability.integrable_mixed_monomial
        (p i) (q i) (r i) (s i) hA hdet).const_mul (c i)]
  apply Finset.sum_congr rfl
  intro i hi
  rw [integral_const_mul]
  congr 1
  simpa only [mul_assoc] using integral_mixed_monomial
    (p i) (q i) (r i) (s i) hA hdet

end
end Grothe.UpperChaos.QuadraticPolynomialMoments
