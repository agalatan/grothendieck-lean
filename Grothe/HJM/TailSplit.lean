import Grothe.Upper.Haagerup

/-!
# Splitting a composed tail at a phase index

`compCoeff haagCoeff Q = compCoeff (cLo K) Q + compCoeff (cHi K) Q` (`compCoeff_split`), so the tail from any output
mode `N` is at most the two partial tails (`tail_split`), and a tail of the outer part is at most its whole series
(`tail_le_whole`).
-/

namespace Grothe.HJM

open Polynomial

variable {Q : ℝ[X]} (hQ : l1 Q ≤ 1)
include hQ

lemma compCoeff_split (K n : ℕ) :
    compCoeff haagCoeff Q n = compCoeff (cLo K) Q n + compCoeff (cHi K) Q n := by
  rw [← compCoeff_add (summable_cLo _) (summable_cHi _) hQ]
  exact congrArg (fun c => compCoeff c Q n) (funext fun k => by unfold cLo cHi; split_ifs <;> ring)

lemma abs_compCoeff_split (K n : ℕ) :
    |compCoeff haagCoeff Q n| ≤ |compCoeff (cLo K) Q n| + |compCoeff (cHi K) Q n| := by
  rw [compCoeff_split hQ K n]; exact abs_add_le _ _

lemma summable_tail (c : ℕ → ℝ) (hc : Summable fun k => |c k|) (N : ℕ) :
    Summable fun n => |compCoeff c Q (n + N)| :=
  (summable_nat_add_iff N).2 (summable_abs_compCoeff hc hQ)

/-- The tail from mode `N` is at most the tails of the phase coefficients below and from `K`. -/
lemma tail_split (K N : ℕ) :
    ∑' n, |compCoeff haagCoeff Q (n + N)| ≤
      ∑' n, |compCoeff (cLo K) Q (n + N)| + ∑' n, |compCoeff (cHi K) Q (n + N)| :=
  (Summable.tsum_le_tsum (fun n => abs_compCoeff_split hQ K (n + N))
      (summable_tail hQ _ summable_haagCoeff N)
      ((summable_tail hQ _ (summable_cLo K) N).add (summable_tail hQ _ (summable_cHi K) N))).trans
    (le_of_eq ((summable_tail hQ _ (summable_cLo K) N).tsum_add (summable_tail hQ _ (summable_cHi K) N)))

/-- A tail of the outer part is at most its whole series. -/
lemma tail_le_whole (K N : ℕ) :
    ∑' n, |compCoeff (cHi K) Q (n + N)| ≤ ∑' n, |compCoeff (cHi K) Q n| := by
  have hhi' := summable_abs_compCoeff (summable_cHi K) hQ
  rw [← hhi'.sum_add_tsum_nat_add N]
  exact le_add_of_nonneg_left (Finset.sum_nonneg fun _ _ => abs_nonneg _)

end Grothe.HJM
