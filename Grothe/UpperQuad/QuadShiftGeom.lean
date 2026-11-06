import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.Complex.Basic

/-!
# Elementary bounds for the conditional shift on a disk (part (Q) of `hQuad`)

* `im_sq_eq`: `(Im A)² = (|A|² − Re A²)/2`, `(Re A)² = (|A|² + Re A²)/2`;
* `angle_defect`: if `u = 1 + ε` with `|ε| ≤ k < 1` then `(Im u)² ≤ k² |u|²` and
  `Re u ≥ √(1 − k²) |u| > 0`;
* `ratio_defect`: `|(1 + δ₁)/(1 + δ₂)² − 1| ≤ (r₁ + r₂(2 + r₂))/(1 − r₂)²` for `|δ_i| ≤ r_i`,
  `r₂ < 1`.

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.QuadRem

open Complex

lemma im_sq_eq (A : ℂ) : A.im ^ 2 = (‖A‖ ^ 2 - (A ^ 2).re) / 2 := by
  rw [← Complex.normSq_eq_norm_sq, Complex.normSq_apply, pow_two A, Complex.mul_re]; ring

lemma re_sq_eq (A : ℂ) : A.re ^ 2 = (‖A‖ ^ 2 + (A ^ 2).re) / 2 := by
  rw [← Complex.normSq_eq_norm_sq, Complex.normSq_apply, pow_two A, Complex.mul_re]; ring

/-- **The angle defect.** -/
theorem angle_defect {ε : ℂ} {k : ℝ} (hk : k < 1) (hε : ‖ε‖ ≤ k) :
    (1 + ε).im ^ 2 ≤ k ^ 2 * ‖1 + ε‖ ^ 2 ∧
      Real.sqrt (1 - k ^ 2) * ‖1 + ε‖ ≤ (1 + ε).re := by
  have hk0 : 0 ≤ k := (norm_nonneg _).trans hε
  set a := ε.re; set b := ε.im
  have hab : a ^ 2 + b ^ 2 ≤ k ^ 2 := by
    have : ‖ε‖ ^ 2 = a ^ 2 + b ^ 2 := by
      rw [← Complex.normSq_eq_norm_sq, Complex.normSq_apply]; ring
    rw [← this]; exact pow_le_pow_left₀ (norm_nonneg _) hε 2
  have hn : ‖1 + ε‖ ^ 2 = (1 + a) ^ 2 + b ^ 2 := by
    rw [← Complex.normSq_eq_norm_sq, Complex.normSq_apply]; simp; ring
  have hre : (1 + ε).re = 1 + a := by simp [a]
  have him : (1 + ε).im = b := by simp [b]
  have h1 : b ^ 2 ≤ k ^ 2 * ((1 + a) ^ 2 + b ^ 2) := by
    have hk1 : 0 ≤ 1 - k ^ 2 := by nlinarith
    have hb : b ^ 2 * (1 - k ^ 2) ≤ (k ^ 2 - a ^ 2) * (1 - k ^ 2) :=
      mul_le_mul_of_nonneg_right (by linarith) hk1
    nlinarith [sq_nonneg (a + k ^ 2)]
  refine ⟨by rw [him, hn]; exact h1, ?_⟩
  have ha1 : 0 < 1 + a := by nlinarith [sq_nonneg b]
  rw [hre]
  have hk2 : 0 ≤ 1 - k ^ 2 := by nlinarith
  have hl : 0 ≤ Real.sqrt (1 - k ^ 2) * ‖1 + ε‖ := by positivity
  apply (pow_le_pow_iff_left₀ hl ha1.le two_ne_zero).mp
  rw [mul_pow, Real.sq_sqrt hk2, hn]
  nlinarith [h1]

/-- **The ratio defect.** -/
theorem ratio_defect {δ₁ δ₂ : ℂ} {r₁ r₂ : ℝ} (h1 : ‖δ₁‖ ≤ r₁) (h2 : ‖δ₂‖ ≤ r₂) (hr₂ : r₂ < 1) :
    ‖(1 + δ₁) / (1 + δ₂) ^ 2 - 1‖ ≤ (r₁ + r₂ * (2 + r₂)) / (1 - r₂) ^ 2 := by
  have hr20 : 0 ≤ r₂ := (norm_nonneg _).trans h2
  have hden : 1 - r₂ ≤ ‖1 + δ₂‖ := by
    have := norm_sub_norm_le (1 : ℂ) (-δ₂)
    rw [norm_one, norm_neg, sub_neg_eq_add] at this
    linarith
  have hne : (1 + δ₂) ≠ 0 := by
    intro h; rw [h, norm_zero] at hden; linarith
  have hsq : (1 + δ₂) ^ 2 ≠ 0 := pow_ne_zero _ hne
  rw [div_sub_one hsq, norm_div, norm_pow]
  have hnum : ‖1 + δ₁ - (1 + δ₂) ^ 2‖ ≤ r₁ + r₂ * (2 + r₂) := by
    have e : 1 + δ₁ - (1 + δ₂) ^ 2 = δ₁ - δ₂ * (2 + δ₂) := by ring
    rw [e]
    refine (norm_sub_le _ _).trans ?_
    rw [norm_mul]
    have : ‖2 + δ₂‖ ≤ 2 + r₂ := by
      refine (norm_add_le _ _).trans ?_
      rw [Complex.norm_ofNat]; linarith
    nlinarith [norm_nonneg δ₂, norm_nonneg (2 + δ₂)]
  have hd2 : (1 - r₂) ^ 2 ≤ ‖1 + δ₂‖ ^ 2 := pow_le_pow_left₀ (by linarith) hden 2
  have hpos : 0 < (1 - r₂) ^ 2 := by nlinarith
  calc ‖1 + δ₁ - (1 + δ₂) ^ 2‖ / ‖1 + δ₂‖ ^ 2 ≤ (r₁ + r₂ * (2 + r₂)) / ‖1 + δ₂‖ ^ 2 :=
        div_le_div_of_nonneg_right hnum (by positivity)
    _ ≤ (r₁ + r₂ * (2 + r₂)) / (1 - r₂) ^ 2 :=
        div_le_div_of_nonneg_left ((norm_nonneg _).trans hnum) hpos hd2

end Grothe.UpperQuad.QuadRem
