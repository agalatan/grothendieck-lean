import Grothe.Haagerup

/-!
# Weighted Wallis tails

For `N ≥ 1` the research note proves (equation (5))

  `W_N := ∑_{n ≥ N} h_n / (2n+1)² < 1 / (48 (N + 1/16)³)`,

by the telescoping comparison (6).  We also record the source's Lemma 6.1
(`∑_{k ≥ N} h_k ≤ 1/(4N)` and `W_N ≤ 1/(48 (N-1)³)`), which the note sharpens.
-/

namespace Grothe

open Finset

noncomputable section

/-- Telescoping majorant `F n = 1 / (48 (n + 1/16)³)`. -/
def F (n : ℕ) : ℝ := 1 / (48 * ((n : ℝ) + 1 / 16) ^ 3)

lemma F_pos (n : ℕ) : 0 < F n := by unfold F; positivity

/-- **Equation (6) of the note**: `1/(4(n+1/4)(n+1)(2n+1)²) < F n - F (n+1)`.  After clearing
denominators the difference is the positive polynomial
`263/8 n⁴ + 1197/16 n³ + 222067/4096 n² + 440847/32768 n + 1242733/1048576`. -/
lemma step_lt (n : ℕ) :
    1 / (4 * ((n : ℝ) + 1 / 4) * (n + 1) * (2 * n + 1) ^ 2) < F n - F (n + 1) := by
  unfold F
  have hn : (0 : ℝ) ≤ n := Nat.cast_nonneg n
  push_cast
  set L : ℝ := 4 * ((n : ℝ) + 1 / 4) * (n + 1) * (2 * n + 1) ^ 2 with hL
  set A : ℝ := ((n : ℝ) + 1 / 16) ^ 3 with hA
  set B : ℝ := ((n : ℝ) + 1 + 1 / 16) ^ 3 with hB
  have hLpos : 0 < L := by rw [hL]; positivity
  have hApos : 0 < A := by rw [hA]; positivity
  have hBpos : 0 < B := by rw [hB]; positivity
  have key : L * (B - A) - 48 * A * B
      = 263 / 8 * (n : ℝ) ^ 4 + 1197 / 16 * n ^ 3 + 222067 / 4096 * n ^ 2
        + 440847 / 32768 * n + 1242733 / 1048576 := by
    rw [hL, hA, hB]; ring
  have hpos : 0 < 263 / 8 * (n : ℝ) ^ 4 + 1197 / 16 * n ^ 3 + 222067 / 4096 * n ^ 2
        + 440847 / 32768 * n + 1242733 / 1048576 := by positivity
  rw [div_sub_div _ _ (by positivity) (by positivity),
    div_lt_div_iff₀ hLpos (by positivity)]
  nlinarith [key, hpos]

lemma h_div_lt (n : ℕ) : h n / (2 * (n : ℝ) + 1) ^ 2 < F n - F (n + 1) := by
  have h1 := h_lt n
  have h2 : (0 : ℝ) < (2 * (n : ℝ) + 1) ^ 2 := by positivity
  calc h n / (2 * (n : ℝ) + 1) ^ 2
      < (1 / (4 * ((n : ℝ) + 1 / 4) * (n + 1))) / (2 * (n : ℝ) + 1) ^ 2 :=
        div_lt_div_of_pos_right h1 h2
    _ = 1 / (4 * ((n : ℝ) + 1 / 4) * (n + 1) * (2 * n + 1) ^ 2) := by
        rw [div_div]
    _ < F n - F (n + 1) := step_lt n

/-- `W N = ∑_{n ≥ N} h_n / (2n+1)²`. -/
def W (N : ℕ) : ℝ := ∑' k : ℕ, h (N + k) / (2 * ((N + k : ℕ) : ℝ) + 1) ^ 2

lemma W_term_nonneg (N k : ℕ) : 0 ≤ h (N + k) / (2 * ((N + k : ℕ) : ℝ) + 1) ^ 2 :=
  div_nonneg (h_nonneg _) (by positivity)

lemma W_partial_le (N M : ℕ) :
    ∑ k ∈ range M, h (N + k) / (2 * ((N + k : ℕ) : ℝ) + 1) ^ 2 ≤ F N - F (N + M) := by
  calc ∑ k ∈ range M, h (N + k) / (2 * ((N + k : ℕ) : ℝ) + 1) ^ 2
      ≤ ∑ k ∈ range M, (F (N + k) - F (N + (k + 1))) :=
        sum_le_sum fun k _ => (h_div_lt (N + k)).le
    _ = F (N + 0) - F (N + M) := Finset.sum_range_sub' (fun k => F (N + k)) M
    _ = F N - F (N + M) := by rw [Nat.add_zero]

lemma W_nonneg (N : ℕ) : 0 ≤ W N := tsum_nonneg (W_term_nonneg N)

/-- **Equation (5) of the note**: `W_N ≤ 1 / (48 (N + 1/16)³)` (for every `N`). -/
theorem W_le_F (N : ℕ) : W N ≤ F N := by
  apply Real.tsum_le_of_sum_le (W_term_nonneg N)
  intro s
  calc ∑ k ∈ s, h (N + k) / (2 * ((N + k : ℕ) : ℝ) + 1) ^ 2
      ≤ ∑ k ∈ range (s.sup id + 1), h (N + k) / (2 * ((N + k : ℕ) : ℝ) + 1) ^ 2 := by
        apply sum_le_sum_of_subset_of_nonneg
        · intro k hk
          exact mem_range.2 (Nat.lt_succ_of_le (le_sup (f := id) hk))
        · intro k _ _; exact W_term_nonneg N k
    _ ≤ F N - F (N + (s.sup id + 1)) := W_partial_le N _
    _ ≤ F N := by linarith [F_pos (N + (s.sup id + 1))]

theorem W_summable (N : ℕ) :
    Summable fun k : ℕ => h (N + k) / (2 * ((N + k : ℕ) : ℝ) + 1) ^ 2 :=
  summable_of_sum_range_le (W_term_nonneg N) fun M =>
    (W_partial_le N M).trans (by linarith [F_pos (N + M)])

theorem W_le (N : ℕ) : W N ≤ 1 / (48 * ((N : ℝ) + 1 / 16) ^ 3) := W_le_F N

/-! ### The source's Lemma 6.1 (weaker tails, not improved by the note but used upstream) -/

lemma h_step (N : ℕ) (hN : 1 ≤ N) (k : ℕ) :
    h (N + k) ≤ 1 / (4 * ((N + k : ℕ) : ℝ)) - 1 / (4 * ((N + (k + 1) : ℕ) : ℝ)) := by
  refine (h_le_classical (N + k) (by omega)).trans (le_of_eq ?_)
  have hN' : (1 : ℝ) ≤ N := by exact_mod_cast hN
  push_cast
  have : (0 : ℝ) < (N : ℝ) + k := by positivity
  field_simp
  ring

lemma h_partial_le (N : ℕ) (hN : 1 ≤ N) (M : ℕ) :
    ∑ k ∈ range M, h (N + k) ≤ 1 / (4 * N) := by
  calc ∑ k ∈ range M, h (N + k)
      ≤ ∑ k ∈ range M, (1 / (4 * ((N + k : ℕ) : ℝ)) - 1 / (4 * ((N + (k + 1) : ℕ) : ℝ))) :=
        sum_le_sum fun k _ => h_step N hN k
    _ = 1 / (4 * ((N + 0 : ℕ) : ℝ)) - 1 / (4 * ((N + M : ℕ) : ℝ)) :=
        Finset.sum_range_sub' (fun k => 1 / (4 * ((N + k : ℕ) : ℝ))) _
    _ ≤ 1 / (4 * N) := by
        rw [Nat.add_zero]
        have : (0 : ℝ) ≤ 1 / (4 * ((N + M : ℕ) : ℝ)) := by positivity
        linarith

/-- Classical telescoping (source Lemma 6.1): `∑_{k ≥ N} h_k ≤ 1/(4N)` for `N ≥ 1`. -/
theorem h_tail_le (N : ℕ) (hN : 1 ≤ N) : ∑' k : ℕ, h (N + k) ≤ 1 / (4 * N) := by
  apply Real.tsum_le_of_sum_le (fun k => h_nonneg _)
  intro s
  calc ∑ k ∈ s, h (N + k)
      ≤ ∑ k ∈ range (s.sup id + 1), h (N + k) := by
        apply sum_le_sum_of_subset_of_nonneg
        · intro k hk
          exact mem_range.2 (Nat.lt_succ_of_le (le_sup (f := id) hk))
        · intro k _ _; exact h_nonneg _
    _ ≤ 1 / (4 * N) := h_partial_le N hN _

theorem h_tail_summable (N : ℕ) (hN : 1 ≤ N) : Summable fun k : ℕ => h (N + k) :=
  summable_of_sum_range_le (fun _ => h_nonneg _) (h_partial_le N hN)

/-- The source's weaker form `W_N ≤ 1/(48 (N-1)³)` for `N ≥ 2`. -/
theorem W_le_source (N : ℕ) (hN : 2 ≤ N) : W N ≤ 1 / (48 * ((N : ℝ) - 1) ^ 3) := by
  refine (W_le_F N).trans ?_
  unfold F
  have hN' : (2 : ℝ) ≤ N := by exact_mod_cast hN
  apply one_div_le_one_div_of_le
  · have : (0 : ℝ) < (N : ℝ) - 1 := by linarith
    positivity
  · have : ((N : ℝ) - 1) ^ 3 ≤ ((N : ℝ) + 1 / 16) ^ 3 := by
      apply pow_le_pow_left₀ (by linarith) (by linarith)
    linarith

end

end Grothe
