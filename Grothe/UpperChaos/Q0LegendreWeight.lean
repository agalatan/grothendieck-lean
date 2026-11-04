import Grothe.UpperChaos.Q0LegendreRoots

/-! Positivity and denominator nonvanishing for the explicit Legendre weight
formula. Identification with the actual Gauss rule is separate.
Agent-ID: codex-aa04. -/

namespace Grothe.UpperChaos.Q0LegendreInteger

/-- Consecutive recurrence polynomials have no common real zero. -/
theorem no_adjacent_common_zero (k : ℕ) (x : ℝ) :
    ¬ ((realPair x k).1 = 0 ∧ (realPair x k).2 = 0) := by
  induction k with
  | zero => simp [realPair]
  | succ k ih =>
      intro h
      simp only [realPair] at h
      have hsecond : (realPair x k).2 = 0 := h.1
      have hk1 : ((k + 1 : ℕ) : ℝ) ≠ 0 := by positivity
      have hk2 : ((k + 2 : ℕ) : ℝ) ≠ 0 := by positivity
      have hmul : ((k + 1 : ℕ) : ℝ) * (realPair x k).1 = 0 := by
        have hz := h.2
        rw [hsecond] at hz
        field_simp at hz
        linarith
      exact ih ⟨(mul_eq_zero.mp hmul).resolve_left hk1, hsecond⟩

/-- Formula used in the saved normalized Gauss–Legendre rule at degree `k+1`. -/
noncomputable def weight (k : ℕ) (x : ℝ) : ℝ :=
  2 * (1 - x ^ 2) / (((k + 1 : ℕ) : ℝ) ^ 2 * (realPair x k).1 ^ 2)

theorem weight_pos_of_root (k : ℕ) (x : ℝ)
    (hx : |x| < 1) (hroot : (realPair x k).2 = 0) : 0 < weight k x := by
  have hprev : (realPair x k).1 ≠ 0 := by
    intro h
    exact no_adjacent_common_zero k x ⟨h, hroot⟩
  have hx' := abs_lt.mp hx
  have hnum : 0 < 1 - x ^ 2 := by nlinarith [sq_nonneg (x - 1), sq_nonneg (x + 1)]
  unfold weight
  positivity

/-- A lower bound on the absolute previous polynomial and a lower bound on
`|x|` turn an exact rational arithmetic check into an upper weight bound. -/
theorem weight_le_of_gaps (k : ℕ) (x v t upper : ℝ)
    (hv : 0 ≤ v) (hx : v ≤ |x|) (ht : 0 < t)
    (hp : t ≤ |(realPair x k).1|) (hu : 0 ≤ upper)
    (hcheck : 2 * (1 - v ^ 2) ≤ upper * (((k + 1 : ℕ) : ℝ) ^ 2 * t ^ 2)) :
    weight k x ≤ upper := by
  have hx2 : v ^ 2 ≤ x ^ 2 := by nlinarith [sq_abs x, abs_nonneg x]
  have hp2 : t ^ 2 ≤ (realPair x k).1 ^ 2 := by
    nlinarith [sq_abs (realPair x k).1, abs_nonneg (realPair x k).1]
  have hprev : (realPair x k).1 ≠ 0 := by
    intro h
    simp [h] at hp
    linarith
  have hden : 0 < (((k + 1 : ℕ) : ℝ) ^ 2 * (realPair x k).1 ^ 2) := by positivity
  have hdenle := mul_le_mul_of_nonneg_left hp2 (sq_nonneg (((k + 1 : ℕ) : ℝ)))
  have hprod := mul_le_mul_of_nonneg_left hdenle hu
  unfold weight
  apply (div_le_iff₀ hden).2
  nlinarith [hprod, hcheck]

end Grothe.UpperChaos.Q0LegendreInteger
