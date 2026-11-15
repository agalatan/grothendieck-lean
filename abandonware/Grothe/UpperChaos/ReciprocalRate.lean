import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-! Reciprocal-variable identities for a positive Gaussian rate.
No nonzero assumption on κ is needed. Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.ReciprocalRate
noncomputable section

def rate (α κ x : ℝ) : ℝ := α + κ ^ 2 / x ^ 2

def denominator (α κ x : ℝ) : ℝ := α * x ^ 2 + κ ^ 2

theorem denominator_pos {α κ x : ℝ} (hα : 0 < α) (hx : 0 < x) :
    0 < denominator α κ x := by
  unfold denominator
  positivity

theorem rate_pos {α κ x : ℝ} (hα : 0 < α) (hx : 0 < x) :
    0 < rate α κ x := by
  unfold rate
  positivity

/-- β⁻¹ = x² / D, including κ = 0. -/
theorem inverse_rate {α κ x : ℝ} (hα : 0 < α) (hx : 0 < x) :
    (rate α κ x)⁻¹ = x ^ 2 / denominator α κ x := by
  have hx0 : x ≠ 0 := ne_of_gt hx
  have hD : denominator α κ x ≠ 0 := ne_of_gt (denominator_pos hα hx)
  have hβ : rate α κ x ≠ 0 := ne_of_gt (rate_pos hα hx)
  dsimp only [rate, denominator] at hD hβ ⊢
  field_simp [hx0, hD, hβ]

/-- The shifted center's reciprocal-variable factor is κ/D. -/
theorem scaled_shift {α κ x : ℝ} (hα : 0 < α) (hx : 0 < x) :
    κ * (1 / x) ^ 2 / rate α κ x = κ / denominator α κ x := by
  have hx0 : x ≠ 0 := ne_of_gt hx
  have hD : denominator α κ x ≠ 0 := ne_of_gt (denominator_pos hα hx)
  rw [div_eq_mul_inv, inverse_rate hα hx]
  field_simp [hx0, hD]

/-- The Jacobian times the squared inverse rate simplifies to x²/D². -/
theorem jacobian_inverse_rate_sq {α κ x : ℝ} (hα : 0 < α) (hx : 0 < x) :
    (1 / x) ^ 2 * ((rate α κ x)⁻¹) ^ 2 =
      x ^ 2 / (denominator α κ x) ^ 2 := by
  have hx0 : x ≠ 0 := ne_of_gt hx
  have hD : denominator α κ x ≠ 0 := ne_of_gt (denominator_pos hα hx)
  rw [inverse_rate hα hx]
  field_simp [hx0, hD]


end
end Grothe.UpperChaos.ReciprocalRate
