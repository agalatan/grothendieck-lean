import Grothe.UpperChaos.HermiteBasis
import Grothe.UpperQuad.QuadMehler

/-!
# Finite polynomial evaluation from the complex Hermite Mehler bound

A total-degree cutoff turns the weighted Mehler sum into an evaluation bound for every finite
linear combination of normalized formal complex Hermite polynomials. The real-part identity for
scaled coordinate pairs is the form needed for polynomial–Gaussian bounds in two real variables.

Agent-ID: codex-1a87. Refs #339.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.FinitePolynomialMehler

open Complex Finset Grothe.UpperChaos
open scoped ComplexConjugate

noncomputable section

/-- The normalized formal complex Hermite polynomial in two independent arguments. -/
def normalizedHf (p q : ℕ) (z₁ z₂ : ℂ) : ℂ :=
  (nrm p q : ℂ) * Mehler.Hf p q z₁ z₂

/-- Squared normalization agrees with the factorial weight in the Mehler sum. -/
lemma norm_normalizedHf_sq (p q : ℕ) (z₁ z₂ : ℂ) :
    ‖normalizedHf p q z₁ z₂‖ ^ 2 =
      ‖Mehler.Hf p q z₁ z₂‖ ^ 2 / ((p.factorial : ℝ) * q.factorial) := by
  rw [normalizedHf, norm_mul, Complex.norm_real, Real.norm_eq_abs,
    abs_of_pos (nrm_pos p q), mul_pow]
  have hfact : 0 ≤ (p.factorial : ℝ) * q.factorial := by positivity
  simp only [nrm, Nat.cast_mul, inv_pow, Real.sq_sqrt hfact]
  ring

/-- A degree cutoff removes the weights from the finite normalized Mehler sum. -/
theorem sum_norm_normalizedHf_sq_le (S : Finset (ℕ × ℕ)) (N : ℕ)
    (hdegree : ∀ pq ∈ S, pq.1 + pq.2 ≤ N)
    (τ : ℝ) (hτ0 : 0 < τ) (hτ1 : τ < 1) (z₁ z₂ : ℂ) :
    ∑ pq ∈ S, ‖normalizedHf pq.1 pq.2 z₁ z₂‖ ^ 2 ≤
      (τ ^ N)⁻¹ * ((1 - τ ^ 2)⁻¹ * Real.exp (Mehler.mehlerExp τ z₁ z₂).re) := by
  apply (le_inv_mul_iff₀ (pow_pos hτ0 N)).2
  calc
    τ ^ N * ∑ pq ∈ S, ‖normalizedHf pq.1 pq.2 z₁ z₂‖ ^ 2 =
        ∑ pq ∈ S, τ ^ N * ‖normalizedHf pq.1 pq.2 z₁ z₂‖ ^ 2 := by
          rw [Finset.mul_sum]
    _ ≤ ∑ pq ∈ S, τ ^ (pq.1 + pq.2) * ‖normalizedHf pq.1 pq.2 z₁ z₂‖ ^ 2 := by
      apply Finset.sum_le_sum
      intro pq hpq
      exact mul_le_mul_of_nonneg_right
        (pow_le_pow_of_le_one hτ0.le hτ1.le (hdegree pq hpq)) (sq_nonneg _)
    _ ≤ (1 - τ ^ 2)⁻¹ * Real.exp (Mehler.mehlerExp τ z₁ z₂).re := by
      simpa only [norm_normalizedHf_sq, mul_div_assoc] using
        Mehler.sum_mehler_le τ hτ0.le hτ1 z₁ z₂ S

/-- Finite normalized Hermite evaluation, with the squared coefficient norm explicit. -/
theorem norm_sum_normalizedHf_sq_le (S : Finset (ℕ × ℕ)) (N : ℕ)
    (hdegree : ∀ pq ∈ S, pq.1 + pq.2 ≤ N) (a : ℕ × ℕ → ℂ)
    (τ : ℝ) (hτ0 : 0 < τ) (hτ1 : τ < 1) (z₁ z₂ : ℂ) :
    ‖∑ pq ∈ S, a pq * normalizedHf pq.1 pq.2 z₁ z₂‖ ^ 2 ≤
      (∑ pq ∈ S, ‖a pq‖ ^ 2) *
        ((τ ^ N)⁻¹ * ((1 - τ ^ 2)⁻¹ * Real.exp (Mehler.mehlerExp τ z₁ z₂).re)) := by
  have htriangle : ‖∑ pq ∈ S, a pq * normalizedHf pq.1 pq.2 z₁ z₂‖ ≤
      ∑ pq ∈ S, ‖a pq‖ * ‖normalizedHf pq.1 pq.2 z₁ z₂‖ := by
    simpa only [norm_mul] using
      norm_sum_le S (fun pq ↦ a pq * normalizedHf pq.1 pq.2 z₁ z₂)
  calc
    ‖∑ pq ∈ S, a pq * normalizedHf pq.1 pq.2 z₁ z₂‖ ^ 2 ≤
        (∑ pq ∈ S, ‖a pq‖ * ‖normalizedHf pq.1 pq.2 z₁ z₂‖) ^ 2 :=
      pow_le_pow_left₀ (norm_nonneg _) htriangle 2
    _ ≤ (∑ pq ∈ S, ‖a pq‖ ^ 2) *
        ∑ pq ∈ S, ‖normalizedHf pq.1 pq.2 z₁ z₂‖ ^ 2 :=
      Finset.sum_mul_sq_le_sq_mul_sq S (fun pq ↦ ‖a pq‖)
        (fun pq ↦ ‖normalizedHf pq.1 pq.2 z₁ z₂‖)
    _ ≤ _ := mul_le_mul_of_nonneg_left
      (sum_norm_normalizedHf_sq_le S N hdegree τ hτ0 hτ1 z₁ z₂)
      (Finset.sum_nonneg fun _ _ ↦ sq_nonneg _)

/-- The Mehler exponent in the complexification of two real coordinates, at any real scale. -/
theorem mehlerExp_pair_re (τ : ℝ) (hτ0 : 0 ≤ τ) (hτ1 : τ < 1)
    (scale : ℝ) (r x : ℂ) :
    (Mehler.mehlerExp τ ((scale : ℂ) * (r + I * x))
      ((scale : ℂ) * (r - I * x))).re =
      2 * scale ^ 2 * τ / (1 + τ) * (r.re ^ 2 + x.re ^ 2) +
        2 * scale ^ 2 * τ / (1 - τ) * (r.im ^ 2 + x.im ^ 2) := by
  have h1 : (1 : ℝ) - τ ^ 2 ≠ 0 := by nlinarith
  have h2 : 1 + τ ≠ 0 := by linarith
  have h3 : 1 - τ ≠ 0 := by linarith
  have hd : (1 - (τ : ℂ) ^ 2) = ((1 - τ ^ 2 : ℝ) : ℂ) := by push_cast; ring
  unfold Mehler.mehlerExp
  rw [hd]
  simp only [Complex.sub_re, Complex.add_re, Complex.mul_re, Complex.div_ofReal_re,
    Complex.ofReal_re, Complex.ofReal_im, Complex.conj_re, Complex.conj_im, Complex.mul_im,
    Complex.sub_im, Complex.add_im, Complex.I_re, Complex.I_im, pow_two]
  field_simp
  ring

/-- The scaled coordinate identity with the positive Gaussian rate as parameter. -/
theorem mehlerExp_scaled_pair_re (τ : ℝ) (hτ0 : 0 ≤ τ) (hτ1 : τ < 1)
    (α : ℝ) (hα : 0 ≤ α) (r x : ℂ) :
    (Mehler.mehlerExp τ ((Real.sqrt α : ℂ) * (r + I * x))
      ((Real.sqrt α : ℂ) * (r - I * x))).re =
      2 * α * τ / (1 + τ) * (r.re ^ 2 + x.re ^ 2) +
        2 * α * τ / (1 - τ) * (r.im ^ 2 + x.im ^ 2) := by
  simpa only [Real.sq_sqrt hα] using mehlerExp_pair_re τ hτ0 hτ1 (Real.sqrt α) r x

end

end Grothe.UpperQuad.FinitePolynomialMehler
