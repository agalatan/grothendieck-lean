import Grothe.Upper.Haagerup

/-!
# Splitting a composed tail at a phase index

`compCoeff haagCoeff Q = compCoeff (cLo K) Q + compCoeff (cHi K) Q`, so the tail from any output mode `N` is at
most the two partial tails (`tail_split`), and a tail of the outer part is at most its whole series
(`tail_le_whole`).
-/

namespace Grothe.HJM

open Polynomial

/-- The tail from mode `N` splits into the phase coefficients below and from `K`. -/
lemma tail_split {Q : ℝ[X]} (hQ : l1 Q ≤ 1) (K N : ℕ) :
    ∑' n, |compCoeff haagCoeff Q (n + N)| ≤
      ∑' n, |compCoeff (cLo K) Q (n + N)| + ∑' n, |compCoeff (cHi K) Q (n + N)| := by
  have hsplit (n : ℕ) : |compCoeff haagCoeff Q n| ≤ |compCoeff (cLo K) Q n| + |compCoeff (cHi K) Q n| := by
    have e : compCoeff haagCoeff Q n = compCoeff (cLo K) Q n + compCoeff (cHi K) Q n := by
      rw [← compCoeff_add (summable_cLo _) (summable_cHi _) hQ]
      exact congrArg (fun c => compCoeff c Q n) (funext fun k => by unfold cLo cHi; split_ifs <;> ring)
    rw [e]; exact abs_add_le _ _
  have hlo : Summable fun n => |compCoeff (cLo K) Q (n + N)| :=
    (summable_nat_add_iff N).2 (summable_abs_compCoeff (summable_cLo _) hQ)
  have hhi : Summable fun n => |compCoeff (cHi K) Q (n + N)| :=
    (summable_nat_add_iff N).2 (summable_abs_compCoeff (summable_cHi K) hQ)
  have hk : Summable fun n => |compCoeff haagCoeff Q (n + N)| :=
    (summable_nat_add_iff N).2 (summable_abs_compCoeff summable_haagCoeff hQ)
  exact (Summable.tsum_le_tsum (fun n => hsplit (n + N)) hk (hlo.add hhi)).trans (le_of_eq (hlo.tsum_add hhi))

/-- A tail of a nonnegative series is at most the whole series. -/
lemma tail_le_whole {Q : ℝ[X]} (hQ : l1 Q ≤ 1) (K N : ℕ) :
    ∑' n, |compCoeff (cHi K) Q (n + N)| ≤ ∑' n, |compCoeff (cHi K) Q n| := by
  have hhi' := summable_abs_compCoeff (summable_cHi K) hQ
  rw [← hhi'.sum_add_tsum_nat_add N]
  exact le_add_of_nonneg_left (Finset.sum_nonneg fun _ _ => abs_nonneg _)

end Grothe.HJM
