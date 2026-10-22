import Mathlib

/-!
# The cubic Taylor phase factor (N0 of PLAN_UPPER)

`P₃(x) = 1 + ix − x²/2 − ix³/6`, the cubic Taylor polynomial of `e^{ix}`.  For real `x`,
`|P₃(x)|² = 1 − x⁴(3 − x²)/36` (`normSq_P3`), so `|P₃(x)| ≤ 1` whenever `x² ≤ 3`
(`norm_P3_le_one`), in particular for `|x| ≤ 1`.  Hence `T = F₀ · P₃(φ)` is disk-valued when
`|F₀| ≤ 1` and `|φ| ≤ 1`.
-/

namespace Grothe.UpperChaos

open Complex

/-- The cubic Taylor polynomial of `e^{ix}`. -/
noncomputable def P3 (x : ℝ) : ℂ := 1 + I * x - (x : ℂ) ^ 2 / 2 - I * (x : ℂ) ^ 3 / 6

lemma P3_re (x : ℝ) : (P3 x).re = 1 - x ^ 2 / 2 := by
  simp [P3, pow_succ]

lemma P3_im (x : ℝ) : (P3 x).im = x - x ^ 3 / 6 := by
  simp [P3, pow_succ]

/-- **`|P₃(x)|² = 1 − x⁴(3 − x²)/36`.** -/
theorem normSq_P3 (x : ℝ) : normSq (P3 x) = 1 - x ^ 4 * (3 - x ^ 2) / 36 := by
  rw [normSq_apply, P3_re, P3_im]; ring

/-- `|P₃(x)| ≤ 1` for `x² ≤ 3`. -/
theorem norm_P3_le_one {x : ℝ} (hx : x ^ 2 ≤ 3) : ‖P3 x‖ ≤ 1 := by
  have h : normSq (P3 x) ≤ 1 := by
    rw [normSq_P3]
    have : 0 ≤ x ^ 4 * (3 - x ^ 2) := mul_nonneg (by positivity) (by linarith)
    linarith
  rw [← sq_le_one_iff₀ (norm_nonneg _), ← normSq_eq_norm_sq]; exact h

/-- `|P₃(x)| ≤ 1` for `|x| ≤ 1`. -/
theorem norm_P3_le_one_of_abs {x : ℝ} (hx : |x| ≤ 1) : ‖P3 x‖ ≤ 1 :=
  norm_P3_le_one (by nlinarith [sq_abs x, abs_nonneg x])

/-- **Disk-valuedness of `T = F₀ P₃(φ)`.** -/
theorem norm_mul_P3_le_one {f : ℂ} {x : ℝ} (hf : ‖f‖ ≤ 1) (hx : |x| ≤ 1) :
    ‖f * P3 x‖ ≤ 1 := by
  rw [norm_mul]
  calc ‖f‖ * ‖P3 x‖ ≤ 1 * 1 := mul_le_mul hf (norm_P3_le_one_of_abs hx) (norm_nonneg _) zero_le_one
    _ = 1 := one_mul 1

end Grothe.UpperChaos
