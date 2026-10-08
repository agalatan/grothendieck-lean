import Grothe.Lower.Profiles

/-!
# Support rows: transfer between witness parameters and two-row mixing

A support row `(ℓ, β, C)` at the witness parameter `ε` is the retained-square inequality

  `V ≤ t² − 2ℓt + C − ε ‖Qh + (β/ε) v‖²`   (`RowHolds`)

for the common data `V, t, Qh, v` of the Gaussian reduction, with `‖v‖² = 2`.  Two elementary
consequences connect the finite certificate layers:

* `rowHolds_transfer`: a row at `εₐ` yields a row at `ε_b ≥ εₐ` with
  `C ↦ C + (ε_b − εₐ) ρ² + 2β² (1/ε_b − 1/εₐ)`, using `‖Qh‖² ≤ ρ²`;
* `rowHolds_mix`: two rows at the same `ε` mix with any fixed weight `θ ∈ [0,1]`:
  `V ≤ (1−θ)Fᵢ(t) + θFⱼ(t) − (2/ε) θ(1−θ) (βᵢ − βⱼ)²`.
-/

namespace Grothe.LowerAnalytic

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- The retained-square support inequality of a row `(ℓ, β, C)` at parameter `ε`. -/
def RowHolds (ε ℓ β C V t : ℝ) (Qh v : E) : Prop :=
  V ≤ t ^ 2 - 2 * ℓ * t + C - ε * ‖Qh + (β / ε) • v‖ ^ 2

lemma rowHolds_mono (ε ℓ β C C' V t : ℝ) (Qh v : E) (h : RowHolds ε ℓ β C V t Qh v)
    (hC : C ≤ C') : RowHolds ε ℓ β C' V t Qh v := by
  unfold RowHolds at *; linarith

/-- `‖Qh + (β/ε)v‖² = ‖Qh‖² + (2β/ε)⟪Qh, v⟫ + 2β²/ε²` when `‖v‖² = 2`. -/
lemma norm_sq_expand (ε β : ℝ) (hε : ε ≠ 0) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) :
    ‖Qh + (β / ε) • v‖ ^ 2 = ‖Qh‖ ^ 2 + 2 * (β / ε) * inner ℝ Qh v + 2 * β ^ 2 / ε ^ 2 := by
  rw [norm_add_sq_real, real_inner_smul_right, norm_smul, mul_pow, Real.norm_eq_abs, sq_abs, hv]
  field_simp
  try ring

/-- **Transfer to a larger witness parameter.** -/
theorem rowHolds_transfer (εa εb ℓ β C V t ρ : ℝ) (hεa : 0 < εa) (hab : εa ≤ εb) (Qh v : E)
    (hv : ‖v‖ ^ 2 = 2) (hQ : ‖Qh‖ ^ 2 ≤ ρ ^ 2) (h : RowHolds εa ℓ β C V t Qh v) :
    RowHolds εb ℓ β (C + (εb - εa) * ρ ^ 2 + 2 * β ^ 2 * (1 / εb - 1 / εa)) V t Qh v := by
  unfold RowHolds at *
  have hεb : 0 < εb := lt_of_lt_of_le hεa hab
  rw [norm_sq_expand εa β hεa.ne' Qh v hv] at h
  rw [norm_sq_expand εb β hεb.ne' Qh v hv]
  have e1 : εa * (2 * (β / εa) * inner ℝ Qh v) = 2 * β * inner ℝ Qh v := by field_simp
  have e2 : εb * (2 * (β / εb) * inner ℝ Qh v) = 2 * β * inner ℝ Qh v := by field_simp
  have e3 : εa * (2 * β ^ 2 / εa ^ 2) = 2 * β ^ 2 / εa := by field_simp; try ring
  have e4 : εb * (2 * β ^ 2 / εb ^ 2) = 2 * β ^ 2 / εb := by field_simp; try ring
  have hdiff : (εb - εa) * ‖Qh‖ ^ 2 ≤ (εb - εa) * ρ ^ 2 :=
    mul_le_mul_of_nonneg_left hQ (by linarith)
  have hrw : 2 * β ^ 2 * (1 / εb - 1 / εa) = 2 * β ^ 2 / εb - 2 * β ^ 2 / εa := by ring
  nlinarith [e1, e2, e3, e4, hdiff, hrw]

/-- Convex combination of two squared norms: `(1−θ)‖a‖² + θ‖b‖² ≥ θ(1−θ)‖a − b‖²`. -/
lemma convex_norm_sq (θ : ℝ) (hθ0 : 0 ≤ θ) (hθ1 : θ ≤ 1) (a b : E) :
    θ * (1 - θ) * ‖a - b‖ ^ 2 ≤ (1 - θ) * ‖a‖ ^ 2 + θ * ‖b‖ ^ 2 := by
  have hid : (1 - θ) * ‖a‖ ^ 2 + θ * ‖b‖ ^ 2
      = ‖(1 - θ) • a + θ • b‖ ^ 2 + θ * (1 - θ) * ‖a - b‖ ^ 2 := by
    rw [norm_add_sq_real, norm_sub_sq_real, norm_smul, norm_smul, real_inner_smul_left,
      real_inner_smul_right, mul_pow, mul_pow, Real.norm_eq_abs, Real.norm_eq_abs,
      abs_of_nonneg (by linarith : (0:ℝ) ≤ 1 - θ), abs_of_nonneg hθ0]
    ring
  rw [hid]
  nlinarith [sq_nonneg ‖(1 - θ) • a + θ • b‖]

/-- **Two-row mixing with a fixed weight.** -/
theorem rowHolds_mix (ε ℓi βi Ci ℓj βj Cj V t : ℝ) (hε : 0 < ε) (Qh v : E) (hv : ‖v‖ ^ 2 = 2)
    (hi : RowHolds ε ℓi βi Ci V t Qh v) (hj : RowHolds ε ℓj βj Cj V t Qh v)
    (θ : ℝ) (hθ0 : 0 ≤ θ) (hθ1 : θ ≤ 1) :
    V ≤ (1 - θ) * (t ^ 2 - 2 * ℓi * t + Ci) + θ * (t ^ 2 - 2 * ℓj * t + Cj)
      - (2 / ε) * θ * (1 - θ) * (βi - βj) ^ 2 := by
  unfold RowHolds at hi hj
  have hcv := convex_norm_sq θ hθ0 hθ1 (Qh + (βi / ε) • v) (Qh + (βj / ε) • v)
  have hdiff : ‖(Qh + (βi / ε) • v) - (Qh + (βj / ε) • v)‖ ^ 2 = 2 * (βi - βj) ^ 2 / ε ^ 2 := by
    have : (Qh + (βi / ε) • v) - (Qh + (βj / ε) • v) = ((βi - βj) / ε) • v := by
      rw [sub_div, sub_smul]; abel
    rw [this, norm_smul, mul_pow, Real.norm_eq_abs, sq_abs, hv]
    field_simp
    try ring
  rw [hdiff] at hcv
  have hVi := mul_le_mul_of_nonneg_left hi (by linarith : (0:ℝ) ≤ 1 - θ)
  have hVj := mul_le_mul_of_nonneg_left hj hθ0
  have e : (2 / ε) * θ * (1 - θ) * (βi - βj) ^ 2 = ε * (θ * (1 - θ) * (2 * (βi - βj) ^ 2 / ε ^ 2)) := by
    field_simp; try ring
  nlinarith [mul_le_mul_of_nonneg_left hcv hε.le]

end Grothe.LowerAnalytic
