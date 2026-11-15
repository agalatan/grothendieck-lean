import Grothe.UpperChaos.DampedQuadraticKernel
import Grothe.UpperChaos.DampedMoments

/-!
# Polynomial integrability at the exact quadratic Schur threshold

Agent-ID: codex-2ca4.

The determinant divided by the trace is a positive coercive rate for every
positive real symmetric two-by-two form. This gives a separable Gaussian
majorant for arbitrary polynomial insertions without strengthening the actual
condition `A*C > B^2`. It does not evaluate the polynomial moments or identify
the historical operator.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.QuadraticPolynomialIntegrability

open WeightedHSMass

noncomputable section

/-- The real Hermitian quadratic form on two complex coordinates. -/
def quadraticForm (A B C : ℝ) (z w : ℂ) : ℝ :=
  A * Complex.normSq z + 2 * B * (z * conj w).re + C * Complex.normSq w

/-- A positive rate derived from the same determinant and leading pivot. -/
def coerciveRate (A B C : ℝ) : ℝ := (A * C - B ^ 2) / (A + C)

theorem trailing_pos {A B C : ℝ} (hA : 0 < A) (hdet : 0 < A * C - B ^ 2) :
    0 < C := by
  by_contra hC
  have hAC : A * C ≤ 0 := mul_nonpos_of_nonneg_of_nonpos hA.le (le_of_not_gt hC)
  nlinarith [sq_nonneg B]

theorem coerciveRate_pos {A B C : ℝ} (hA : 0 < A)
    (hdet : 0 < A * C - B ^ 2) : 0 < coerciveRate A B C := by
  exact div_pos hdet (add_pos hA (trailing_pos hA hdet))

/-- The trace identity exposes the coercivity remainder as two squared norms. -/
theorem trace_identity (A B C : ℝ) (z w : ℂ) :
    (A + C) * quadraticForm A B C z w -
        (A * C - B ^ 2) * (Complex.normSq z + Complex.normSq w) =
      Complex.normSq ((A : ℂ) * z + (B : ℂ) * w) +
        Complex.normSq ((B : ℂ) * z + (C : ℂ) * w) := by
  simp only [quadraticForm, Complex.normSq_apply, Complex.add_re, Complex.add_im,
    Complex.mul_re, Complex.mul_im, Complex.conj_re, Complex.conj_im,
    Complex.ofReal_re, Complex.ofReal_im]
  ring

/-- No margin beyond the actual positive determinant is needed. -/
theorem quadraticForm_lower_bound {A B C : ℝ} (hA : 0 < A)
    (hdet : 0 < A * C - B ^ 2) (z w : ℂ) :
    coerciveRate A B C * (Complex.normSq z + Complex.normSq w) ≤
      quadraticForm A B C z w := by
  have htrace : 0 < A + C := add_pos hA (trailing_pos hA hdet)
  have hid := trace_identity A B C z w
  have hleft := Complex.normSq_nonneg ((A : ℂ) * z + (B : ℂ) * w)
  have hright := Complex.normSq_nonneg ((B : ℂ) * z + (C : ℂ) * w)
  unfold coerciveRate
  rw [div_mul_eq_mul_div]
  apply (div_le_iff₀ htrace).2
  nlinarith

/-- Relative to the standard product Gaussian, the correlated weight is
bounded by two independent damped Gaussian weights at a positive rate. -/
theorem quadraticWeight_le_separable {A B C : ℝ} (hA : 0 < A)
    (hdet : 0 < A * C - B ^ 2) (z w : ℂ) :
    quadraticWeight A B C (z, w) ≤
      Real.exp (-(coerciveRate A B C - 1) * Complex.normSq z) *
        Real.exp (-(coerciveRate A B C - 1) * Complex.normSq w) := by
  have h := quadraticForm_lower_bound hA hdet z w
  unfold quadraticWeight
  rw [← Real.exp_add]
  apply Real.exp_le_exp.mpr
  unfold quadraticForm at h
  nlinarith

/-- Every four-power mixed complex monomial is integrable against the
correlated Gaussian under the original two Schur positivity hypotheses. -/
theorem integrable_mixed_monomial (p q r s : ℕ) {A B C : ℝ}
    (hA : 0 < A) (hdet : 0 < A * C - B ^ 2) :
    Integrable (fun zw : ℂ × ℂ =>
      (zw.1 ^ p * conj zw.1 ^ q) * (zw.2 ^ r * conj zw.2 ^ s) *
        (quadraticWeight A B C zw : ℂ)) (gaussC.prod gaussC) := by
  have hrate := coerciveRate_pos hA hdet
  have hmajorant := (integrable_monomial_damped p q hrate).norm.mul_prod
    (integrable_monomial_damped r s hrate).norm
  refine hmajorant.mono' (by unfold quadraticWeight; fun_prop)
    (Filter.Eventually.of_forall fun zw => ?_)
  have h := mul_le_mul_of_nonneg_left
    (quadraticWeight_le_separable hA hdet zw.1 zw.2)
    (mul_nonneg (norm_nonneg (zw.1 ^ p * conj zw.1 ^ q))
      (norm_nonneg (zw.2 ^ r * conj zw.2 ^ s)))
  simpa only [norm_mul, Complex.norm_real, Real.norm_eq_abs,
    abs_of_pos (quadraticWeight_pos A B C zw), abs_of_pos (Real.exp_pos _),
    mul_assoc, mul_left_comm, mul_comm] using h

/-- Finite mixed polynomials inherit joint integrability term by term.
This is sufficient for product Fubini before any iterated evaluation. -/
theorem integrable_finite_mixed_polynomial {ι : Type*} (t : Finset ι)
    (c : ι → ℂ) (p q r s : ι → ℕ) {A B C : ℝ}
    (hA : 0 < A) (hdet : 0 < A * C - B ^ 2) :
    Integrable (fun zw : ℂ × ℂ =>
      (∑ i ∈ t, c i * ((zw.1 ^ p i * conj zw.1 ^ q i) *
        (zw.2 ^ r i * conj zw.2 ^ s i))) *
          (quadraticWeight A B C zw : ℂ)) (gaussC.prod gaussC) := by
  classical
  have hi : Integrable (fun zw : ℂ × ℂ => ∑ i ∈ t, c i *
      ((zw.1 ^ p i * conj zw.1 ^ q i) * (zw.2 ^ r i * conj zw.2 ^ s i) *
        (quadraticWeight A B C zw : ℂ))) (gaussC.prod gaussC) :=
    integrable_finsetSum t fun i _ =>
      (integrable_mixed_monomial (p i) (q i) (r i) (s i) hA hdet).const_mul (c i)
  refine hi.congr (Filter.Eventually.of_forall fun zw => ?_)
  simp only [Finset.sum_mul, mul_assoc]

end
end Grothe.UpperChaos.QuadraticPolynomialIntegrability
