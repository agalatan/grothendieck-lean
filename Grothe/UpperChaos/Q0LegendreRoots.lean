import Grothe.UpperChaos.Q0LegendreInteger

/-! Continuity and endpoint-inclusive root existence for the explicit
Legendre recurrence. Ordering and Gauss quadrature are separate obligations.
Agent-ID: codex-aa04. -/

namespace Grothe.UpperChaos.Q0LegendreInteger

theorem continuous_realPair (k : ℕ) : Continuous (fun x => realPair x k) := by
  induction k with
  | zero => simpa [realPair] using (continuous_const.prodMk continuous_id :
      Continuous (fun x : ℝ => ((1 : ℝ), x)))
  | succ k ih =>
      have hfirst := ih.fst
      have hsecond := ih.snd
      change Continuous (fun x => ((realPair x k).2,
        (((2 * k + 3 : ℕ) : ℝ) * x * (realPair x k).2 -
          ((k + 1 : ℕ) : ℝ) * (realPair x k).1) / ((k + 2 : ℕ) : ℝ)))
      exact hsecond.prodMk (((continuous_const.mul continuous_id).mul hsecond).sub
        (continuous_const.mul hfirst) |>.div_const _)

/-- Opposite weak signs include an exact root at either endpoint. -/
theorem exists_root_of_endpoint_signs (k : ℕ) {a b : ℝ} (hab : a ≤ b)
    (h : ((realPair a k).2 ≤ 0 ∧ 0 ≤ (realPair b k).2) ∨
      ((realPair b k).2 ≤ 0 ∧ 0 ≤ (realPair a k).2)) :
    ∃ x ∈ Set.Icc a b, (realPair x k).2 = 0 := by
  have hc : Continuous (fun x => (realPair x k).2) := (continuous_realPair k).snd
  rcases h with h | h
  · exact intermediate_value_Icc hab hc.continuousOn h
  · exact intermediate_value_Icc' hab hc.continuousOn h

/-- A nonpositive scaled integer certifies the corresponding real sign. -/
theorem real_nonpos_of_integer_nonpos (X D : ℤ) (hD : 0 < D) (k : ℕ)
    (h : (integerPair X D k).2 ≤ 0) :
    (realPair ((X : ℝ) / D) k).2 ≤ 0 := by
  have hDr : (0 : ℝ) < D := by exact_mod_cast hD
  have hs : 0 < ((k + 1).factorial : ℝ) * (D : ℝ) ^ (k + 1) := by
    positivity
  have hv : (((integerPair X D k).2 : ℤ) : ℝ) ≤ 0 := by exact_mod_cast h
  rw [(integerPair_sound X D (ne_of_gt hD) k).2] at hv
  by_contra hn
  have hp := mul_pos hs (lt_of_not_ge hn)
  linarith

/-- A nonnegative scaled integer certifies the corresponding real sign. -/
theorem real_nonneg_of_integer_nonneg (X D : ℤ) (hD : 0 < D) (k : ℕ)
    (h : 0 ≤ (integerPair X D k).2) :
    0 ≤ (realPair ((X : ℝ) / D) k).2 := by
  have hDr : (0 : ℝ) < D := by exact_mod_cast hD
  have hs : 0 < ((k + 1).factorial : ℝ) * (D : ℝ) ^ (k + 1) := by
    positivity
  have hv : 0 ≤ (((integerPair X D k).2 : ℤ) : ℝ) := by exact_mod_cast h
  rw [(integerPair_sound X D (ne_of_gt hD) k).2] at hv
  by_contra hn
  have hp := mul_neg_of_pos_of_neg hs (lt_of_not_ge hn)
  linarith

/-- A pair of checked endpoint signs yields a root in the original bracket. -/
theorem root_of_integer_endpoint_signs (lo hi D : ℤ) (hD : 0 < D) (hle : lo ≤ hi)
    (k : ℕ) (hsigns : ((integerPair lo D k).2 ≤ 0 ∧ 0 ≤ (integerPair hi D k).2) ∨
      ((integerPair hi D k).2 ≤ 0 ∧ 0 ≤ (integerPair lo D k).2)) :
    ∃ x ∈ Set.Icc ((lo : ℝ) / D) ((hi : ℝ) / D), (realPair x k).2 = 0 := by
  have hDr : (0 : ℝ) < D := by exact_mod_cast hD
  have hab : (lo : ℝ) / D ≤ (hi : ℝ) / D := by
    exact div_le_div_of_nonneg_right (by exact_mod_cast hle) hDr.le
  apply exists_root_of_endpoint_signs k hab
  rcases hsigns with h | h
  · exact Or.inl ⟨real_nonpos_of_integer_nonpos lo D hD k h.1,
      real_nonneg_of_integer_nonneg hi D hD k h.2⟩
  · exact Or.inr ⟨real_nonpos_of_integer_nonpos hi D hD k h.1,
      real_nonneg_of_integer_nonneg lo D hD k h.2⟩

end Grothe.UpperChaos.Q0LegendreInteger
