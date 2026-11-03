import Mathlib.Data.Nat.Sqrt
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Tactic

/-! A computable lower rounding of a nonnegative rational square root.
The error proof applies to every numerator and denominator, so evaluating a
new entry needs no separate numerical interval certificate.
Agent-ID: codex-7c2e -/

namespace Grothe.UpperChaos.RationalSqrtFloor

/-- Round the nonnegative square root of `P / Q` down to the grid `1 / S`.
Only natural-number division and square root are evaluated. -/
def sqrtFloor (P Q S : ℕ) : ℚ :=
  (Nat.sqrt (S ^ 2 * P / Q) : ℚ) / S

private theorem sqrtFloor_integer_bounds (P Q S : ℕ) (hQ : 0 < Q) :
    (Nat.sqrt (S ^ 2 * P / Q)) ^ 2 * Q ≤ S ^ 2 * P ∧
      S ^ 2 * P < (Nat.sqrt (S ^ 2 * P / Q) + 1) ^ 2 * Q := by
  constructor
  · exact (Nat.mul_le_mul_right Q (Nat.sqrt_le' _)).trans
      (Nat.div_mul_le_self _ _)
  · exact (Nat.div_lt_iff_lt_mul hQ).mp (Nat.lt_succ_sqrt' _)

/-- The rational lower rounding encloses every nonnegative real square root
in an interval of width `1 / S`. -/
theorem sqrtFloor_bounds (P Q S : ℕ) (hQ : 0 < Q) (hS : 0 < S)
    (x : ℝ) (hx0 : 0 ≤ x) (hx : x ^ 2 = (P : ℝ) / Q) :
    (sqrtFloor P Q S : ℝ) ≤ x ∧
      x ≤ (sqrtFloor P Q S : ℝ) + 1 / (S : ℝ) := by
  let k := Nat.sqrt (S ^ 2 * P / Q)
  have hQr : (0 : ℝ) < Q := by exact_mod_cast hQ
  have hSr : (0 : ℝ) < S := by exact_mod_cast hS
  have hxQ : x ^ 2 * (Q : ℝ) = P := (eq_div_iff hQr.ne').mp hx
  obtain ⟨hlo, hhi⟩ := sqrtFloor_integer_bounds P Q S hQ
  have hloR : (k : ℝ) ^ 2 * (Q : ℝ) ≤ (S : ℝ) ^ 2 * P := by
    exact_mod_cast hlo
  have hhiR : (S : ℝ) ^ 2 * P ≤ ((k : ℝ) + 1) ^ 2 * Q := by
    exact_mod_cast hhi.le
  have hscaled : ((S : ℝ) * x) ^ 2 * Q = (S : ℝ) ^ 2 * P := by
    rw [← hxQ]
    ring
  have hlow : (k : ℝ) ≤ (S : ℝ) * x := by
    apply (sq_le_sq₀ (Nat.cast_nonneg k) (mul_nonneg hSr.le hx0)).mp
    apply (mul_le_mul_iff_of_pos_right hQr).mp
    rw [hscaled]
    exact hloR
  have hupp : (S : ℝ) * x ≤ (k : ℝ) + 1 := by
    apply (sq_le_sq₀ (mul_nonneg hSr.le hx0) (by positivity)).mp
    apply (mul_le_mul_iff_of_pos_right hQr).mp
    rw [hscaled]
    exact hhiR
  have hcast : (sqrtFloor P Q S : ℝ) = (k : ℝ) / S := by
    simp [sqrtFloor, k]
  constructor
  · rw [hcast, div_le_iff₀ hSr]
    simpa only [mul_comm] using hlow
  · calc
      x ≤ ((k : ℝ) + 1) / S := (le_div_iff₀ hSr).mpr (by
        simpa only [mul_comm] using hupp)
      _ = (sqrtFloor P Q S : ℝ) + 1 / (S : ℝ) := by rw [hcast, add_div]

/-- Uniform error for the computable rational square-root rounding. -/
theorem norm_sub_sqrtFloor_le (P Q S : ℕ) (hQ : 0 < Q) (hS : 0 < S)
    (x : ℝ) (hx0 : 0 ≤ x) (hx : x ^ 2 = (P : ℝ) / Q) :
    ‖x - (sqrtFloor P Q S : ℝ)‖ ≤ 1 / (S : ℝ) := by
  obtain ⟨hlo, hhi⟩ := sqrtFloor_bounds P Q S hQ hS x hx0 hx
  rw [Real.norm_eq_abs, abs_of_nonneg (sub_nonneg.mpr hlo)]
  linarith

end Grothe.UpperChaos.RationalSqrtFloor

/-- info: 'Grothe.UpperChaos.RationalSqrtFloor.norm_sub_sqrtFloor_le' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.RationalSqrtFloor.norm_sub_sqrtFloor_le
