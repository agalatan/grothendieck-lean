import Mathlib

/-!
# Rows: the retained-square inequality and two-row mixing

A row `(ℓ, β, C)` at the witness parameter `ε` is the retained-square inequality

  `V ≤ t² − 2ℓt + C − ε ‖Qh + (β/ε) v‖²`   (`RowHolds`)

for the common data `V, t, Qh, v` of the Gaussian reduction, with `‖v‖² = 2`.  Two rows at the
same `ε` mix with any fixed weight `θ ∈ [0,1]` into the row of the mixed parameters, with
`C = (1−θ)Cᵢ + θCⱼ − (2/ε) θ(1−θ) (βᵢ − βⱼ)²` (`RowHolds.mix`); the square is retained, so mixtures
mix again.
-/

namespace Grothe.LowerAnalytic

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- The retained-square inequality of a row `(ℓ, β, C)` at parameter `ε`. -/
def RowHolds (ε ℓ β C V t : ℝ) (Qh v : E) : Prop :=
  V ≤ t ^ 2 - 2 * ℓ * t + C - ε * ‖Qh + (β / ε) • v‖ ^ 2

/-- `(1−θ)‖a‖² + θ‖b‖² = ‖(1−θ)a + θb‖² + θ(1−θ)‖a − b‖²`. -/
lemma mix_norm_sq (θ : ℝ) (hθ0 : 0 ≤ θ) (hθ1 : θ ≤ 1) (a b : E) :
    (1 - θ) * ‖a‖ ^ 2 + θ * ‖b‖ ^ 2
      = ‖(1 - θ) • a + θ • b‖ ^ 2 + θ * (1 - θ) * ‖a - b‖ ^ 2 := by
  rw [norm_add_sq_real, norm_sub_sq_real, norm_smul, norm_smul, real_inner_smul_left,
    real_inner_smul_right, mul_pow, mul_pow, Real.norm_eq_abs, Real.norm_eq_abs,
    abs_of_nonneg (by linarith : (0:ℝ) ≤ 1 - θ), abs_of_nonneg hθ0]
  ring

/-- **Two-row mixing with a fixed weight**, retaining the square. -/
theorem RowHolds.mix {ε ℓi βi Ci ℓj βj Cj V t : ℝ} (hε : 0 < ε) {Qh v : E} (hv : ‖v‖ ^ 2 = 2)
    (hi : RowHolds ε ℓi βi Ci V t Qh v) (hj : RowHolds ε ℓj βj Cj V t Qh v)
    (θ : ℝ) (hθ0 : 0 ≤ θ) (hθ1 : θ ≤ 1) :
    RowHolds ε ((1 - θ) * ℓi + θ * ℓj) ((1 - θ) * βi + θ * βj)
      ((1 - θ) * Ci + θ * Cj - (2 / ε) * θ * (1 - θ) * (βi - βj) ^ 2) V t Qh v := by
  unfold RowHolds at hi hj ⊢
  have hsq := mix_norm_sq θ hθ0 hθ1 (Qh + (βi / ε) • v) (Qh + (βj / ε) • v)
  have e1 : (1 - θ) • (Qh + (βi / ε) • v) + θ • (Qh + (βj / ε) • v)
      = Qh + (((1 - θ) * βi + θ * βj) / ε) • v := by
    module
  have e2 : ‖(Qh + (βi / ε) • v) - (Qh + (βj / ε) • v)‖ ^ 2 = 2 * (βi - βj) ^ 2 / ε ^ 2 := by
    have : (Qh + (βi / ε) • v) - (Qh + (βj / ε) • v) = ((βi - βj) / ε) • v := by
      rw [sub_div, sub_smul]; abel
    rw [this, norm_smul, mul_pow, Real.norm_eq_abs, sq_abs, hv]
    ring
  rw [e1, e2] at hsq
  have hVi := mul_le_mul_of_nonneg_left hi (by linarith : (0:ℝ) ≤ 1 - θ)
  have hVj := mul_le_mul_of_nonneg_left hj hθ0
  have e3 : (2 / ε) * θ * (1 - θ) * (βi - βj) ^ 2
      = ε * (θ * (1 - θ) * (2 * (βi - βj) ^ 2 / ε ^ 2)) := by
    field_simp
  nlinarith [hsq, e3]

/-- Dropping the retained square. -/
lemma RowHolds.le {ε ℓ β C V t : ℝ} (hε : 0 ≤ ε) {Qh v : E} (h : RowHolds ε ℓ β C V t Qh v) :
    V ≤ t ^ 2 - 2 * ℓ * t + C := by
  unfold RowHolds at h
  nlinarith [mul_nonneg hε (sq_nonneg ‖Qh + (β / ε) • v‖)]

end Grothe.LowerAnalytic
