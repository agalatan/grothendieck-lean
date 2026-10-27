import Grothe.UpperChaos.HardyRealLaw
import Grothe.UpperChaos.HardyStep4
import Grothe.UpperChaos.Realise2
import Grothe.UpperChaos.Kernel2

/-!
# Hardy step 1(b): the real identification, and the `hardy` input of the sharp upper bound

For real `0 < t < 1` let `p = t P(t²)`, `q = t Q(t²)` (the preprocessors of the certificate), `R = Rt t`. Then

    ∑ⱼ hⱼ t^{2j+1} = HholPair Tround Tround (Rt t),     h = kernelCoeff (energy G_T)          (`hreal_GT`)

The left side is the Mehler correlation `E[conj G_T(X) G_T(Y)]` (`Bm_polyKernel`, `Bm_toLp`). Unfolding the
smoothing `G_T(x) = E_Z T(Mx + NZ)` (Fubini, `mehler_smoothed`) gives `E[conj T(U) T(V)]` for the smoothed
Mehler pair, whose law is that of `(u, Ru + Sw)` (`law_swap`), whose density is `kHol R` (`integral_pair_eq_kHol`).
`I − R² ≻ 0` because `R = M diag(p, q) M` with `‖M‖ ≤ 1` and `|p|, |q| ≤ t < 1` (`k11_pos`, `kdet_pos`).

With the region and circle mean of step 4 (`hardy_of_real`) this proves the `hardy` input for the actual rounding
(`hardy_GT`).
-/

open MeasureTheory Complex
open scoped ComplexConjugate

namespace Grothe.UpperChaos.HardyReal

noncomputable section

/-! ### The real correlations and `Rt t` -/

/-- `p = t P(t²)` and `q = t Q(t²)` for the two preprocessors. -/
def pr (t : ℝ) : ℝ := t * Grothe.Upper.primaryPoly.eval (t ^ 2)
def qr (t : ℝ) : ℝ := t * Grothe.Upper.auxPoly.eval (t ^ 2)

/-- The entries `a, b, c` of `R = M diag(p, q) M`. -/
def ra (t : ℝ) : ℝ := m00 ^ 2 * pr t + m01 ^ 2 * qr t
def rb (t : ℝ) : ℝ := m00 * m01 * pr t + m01 * m11 * qr t
def rc (t : ℝ) : ℝ := m01 ^ 2 * pr t + m11 ^ 2 * qr t

lemma Rt_real (t : ℝ) : Rt (t : ℂ) = Rre (ra t) (rb t) (rc t) := by
  have e1 : Polynomial.aeval ((t : ℂ) ^ 2) Grothe.Upper.primaryPoly =
      ((Grothe.Upper.primaryPoly.eval (t ^ 2) : ℝ) : ℂ) := by
    rw [Polynomial.ofReal_eval]; push_cast; rfl
  have e2 : Polynomial.aeval ((t : ℂ) ^ 2) Grothe.Upper.auxPoly =
      ((Grothe.Upper.auxPoly.eval (t ^ 2) : ℝ) : ℂ) := by
    rw [Polynomial.ofReal_eval]; push_cast; rfl
  simp only [Rt, Rre, e1, e2, ra, rb, rc, pr, qr]
  push_cast; ring_nf

lemma polyKernel_real (P : Polynomial ℝ) {t : ℝ} (ht : 0 ≤ t) :
    Grothe.polyKernel P (t : ℂ) = ((t * P.eval (t ^ 2) : ℝ) : ℂ) := by
  rw [Grothe.polyKernel, Complex.norm_real, Real.norm_of_nonneg ht]; push_cast; ring

lemma abs_mul_eval_le {P : Polynomial ℝ} (hP : Grothe.l1 P ≤ 1) {t : ℝ} (ht0 : 0 ≤ t) (ht1 : t ≤ 1) :
    |t * P.eval (t ^ 2)| ≤ t := by
  rw [abs_mul, abs_of_nonneg ht0]
  have := (Grothe.abs_eval_le_l1 P (sq_nonneg t) (by nlinarith)).trans hP
  nlinarith

lemma abs_pr_le {t : ℝ} (ht0 : 0 ≤ t) (ht1 : t ≤ 1) : |pr t| ≤ t :=
  abs_mul_eval_le Grothe.l1_primaryPoly ht0 ht1

lemma abs_qr_le {t : ℝ} (ht0 : 0 ≤ t) (ht1 : t ≤ 1) : |qr t| ≤ t :=
  abs_mul_eval_le Grothe.l1_auxPoly ht0 ht1

/-! ### `I − R² ≻ 0` -/

/-- `‖My‖ ≤ ‖y‖` (from `M² + N² = I`). -/
lemma normM_le (y₁ y₂ : ℝ) : (m00 * y₁ + m01 * y₂) ^ 2 + (m01 * y₁ + m11 * y₂) ^ 2 ≤ y₁ ^ 2 + y₂ ^ 2 := by
  have e : (m00 * y₁ + m01 * y₂) ^ 2 + (m01 * y₁ + m11 * y₂) ^ 2 + (n00 * y₁ + n01 * y₂) ^ 2
      + (n01 * y₁ + n11 * y₂) ^ 2 = y₁ ^ 2 + y₂ ^ 2 := by
    linear_combination y₁ ^ 2 * mn_00 + 2 * y₁ * y₂ * mn_01 + y₂ ^ 2 * mn_11
  nlinarith [sq_nonneg (n00 * y₁ + n01 * y₂), sq_nonneg (n01 * y₁ + n11 * y₂)]

/-- `‖Rx‖² ≤ t² ‖x‖²` for `R = M diag(p, q) M`, `|p|, |q| ≤ t`. -/
lemma normR_le {p q t : ℝ} (hp : |p| ≤ t) (hq : |q| ≤ t) (x₁ x₂ : ℝ) :
    ((m00 ^ 2 * p + m01 ^ 2 * q) * x₁ + (m00 * m01 * p + m01 * m11 * q) * x₂) ^ 2 +
      ((m00 * m01 * p + m01 * m11 * q) * x₁ + (m01 ^ 2 * p + m11 ^ 2 * q) * x₂) ^ 2 ≤
      t ^ 2 * (x₁ ^ 2 + x₂ ^ 2) := by
  set y₁ := m00 * x₁ + m01 * x₂
  set y₂ := m01 * x₁ + m11 * x₂
  have e1 : (m00 ^ 2 * p + m01 ^ 2 * q) * x₁ + (m00 * m01 * p + m01 * m11 * q) * x₂
      = m00 * (p * y₁) + m01 * (q * y₂) := by ring
  have e2 : (m00 * m01 * p + m01 * m11 * q) * x₁ + (m01 ^ 2 * p + m11 ^ 2 * q) * x₂
      = m01 * (p * y₁) + m11 * (q * y₂) := by ring
  rw [e1, e2]
  have h1 := normM_le (p * y₁) (q * y₂)
  have h2 := normM_le x₁ x₂
  have hp2 : p ^ 2 ≤ t ^ 2 := by rw [← sq_abs]; exact pow_le_pow_left₀ (abs_nonneg _) hp 2
  have hq2 : q ^ 2 ≤ t ^ 2 := by rw [← sq_abs]; exact pow_le_pow_left₀ (abs_nonneg _) hq 2
  have h3 : (p * y₁) ^ 2 + (q * y₂) ^ 2 ≤ t ^ 2 * (y₁ ^ 2 + y₂ ^ 2) := by
    rw [mul_pow, mul_pow]; nlinarith [sq_nonneg y₁, sq_nonneg y₂]
  have h4 : t ^ 2 * (y₁ ^ 2 + y₂ ^ 2) ≤ t ^ 2 * (x₁ ^ 2 + x₂ ^ 2) :=
    mul_le_mul_of_nonneg_left h2 (sq_nonneg t)
  linarith

/-- `k₁₁ > 0` and `det(I − R²) > 0` for real `0 ≤ t < 1`. -/
theorem k11_kdet_pos {t : ℝ} (ht0 : 0 ≤ t) (ht1 : t < 1) :
    0 < k11 (ra t) (rb t) ∧ 0 < kdet (ra t) (rb t) (rc t) := by
  have hp := abs_pr_le ht0 ht1.le
  have hq := abs_qr_le ht0 ht1.le
  have ht2 : t ^ 2 < 1 := by nlinarith
  -- the quadratic form of `K = I − R²` is `‖x‖² − ‖Rx‖² ≥ (1 − t²)‖x‖²`
  have hK : ∀ x₁ x₂ : ℝ, (1 - t ^ 2) * (x₁ ^ 2 + x₂ ^ 2) ≤
      k11 (ra t) (rb t) * x₁ ^ 2 + 2 * k12 (ra t) (rb t) (rc t) * x₁ * x₂ + k22 (rb t) (rc t) * x₂ ^ 2 := by
    intro x₁ x₂
    have := normR_le hp hq x₁ x₂
    simp only [k11, k12, k22, ra, rb, rc] at *
    nlinarith
  have h11 : 0 < k11 (ra t) (rb t) := by
    have := hK 1 0; nlinarith
  refine ⟨h11, ?_⟩
  have h := hK (-k12 (ra t) (rb t) (rc t)) (k11 (ra t) (rb t))
  have e : k11 (ra t) (rb t) * (-k12 (ra t) (rb t) (rc t)) ^ 2
      + 2 * k12 (ra t) (rb t) (rc t) * (-k12 (ra t) (rb t) (rc t)) * k11 (ra t) (rb t)
      + k22 (rb t) (rc t) * k11 (ra t) (rb t) ^ 2 = k11 (ra t) (rb t) * kdet (ra t) (rb t) (rc t) := by
    simp only [kdet]; ring
  rw [e] at h
  have hpos : 0 < (1 - t ^ 2) * ((-k12 (ra t) (rb t) (rc t)) ^ 2 + k11 (ra t) (rb t) ^ 2) := by
    have : 0 < 1 - t ^ 2 := by linarith
    positivity
  exact (pos_iff_pos_of_mul_pos (hpos.trans_le h)).1 h11

end

end Grothe.UpperChaos.HardyReal
