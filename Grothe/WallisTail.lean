import Grothe.Haagerup

/-!
# Wallis tails of Haagerup's coefficients

From `hₙ ≤ 1/(4n(n+1))` (`h_le_classical`) the tails telescope:
`∑_{k ≥ N} h_k ≤ 1/(4N)` for `N ≥ 1`, with summability.
-/

namespace Grothe

open Finset

noncomputable section

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

/-- Telescoping Wallis tail: `∑_{k ≥ N} h_k ≤ 1/(4N)` for `N ≥ 1`. -/
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

end

end Grothe
