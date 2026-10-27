import Grothe.Haagerup.WallisTail
import Grothe.Haagerup.PhaseCoefficients
import Grothe.HJM.OriginLaguerre
import Mathlib.Topology.Algebra.InfiniteSum.Real

/-!
# Inverse-degree-weighted tail of the actual Gaussian phase

Agent-ID: codex-aa04.

The Wallis coefficient estimate is dominated by the discrete derivative of
`1 / (48 n³)`. Finite telescoping and nonnegativity therefore bound the entire
weighted phase suffix. The actual charge-one phase coefficients inherit the
same estimate from `Haag.phase_energy`, retaining the original degree `2n+1`.
No numerical origin energy enclosure is used or asserted.
-/

open Finset
open scoped InnerProductSpace

namespace Grothe.HJM.Origin

noncomputable section

/-- The telescoping potential for the inverse-square-degree phase energy. -/
def phaseWeightedMajorant (n : ℕ) : ℝ := 1 / (48 * (n : ℝ) ^ 3)

lemma phaseWeightedMajorant_nonneg (n : ℕ) : 0 ≤ phaseWeightedMajorant n := by
  unfold phaseWeightedMajorant
  positivity

/-- An elementary rational majorant of the weighted Wallis coefficient. -/
theorem haagCoeff_weighted_le_rational (n : ℕ) (hn : 1 ≤ n) :
    haagCoeff n / (2 * (n : ℝ) + 1) ^ 2 ≤
      1 / (16 * (n : ℝ) ^ 2 * ((n : ℝ) + 1) ^ 2) := by
  have hnpos : 0 < (n : ℝ) := by exact_mod_cast (show 0 < n by omega)
  have hden : 16 * (n : ℝ) ^ 2 * ((n : ℝ) + 1) ^ 2 ≤
      ((4 * (n : ℝ) + 1) * ((n : ℝ) + 1)) * (2 * (n : ℝ) + 1) ^ 2 := by
    calc
      _ = (4 * (n : ℝ) * ((n : ℝ) + 1)) *
          (4 * (n : ℝ) * ((n : ℝ) + 1)) := by ring
      _ ≤ _ := mul_le_mul (by nlinarith) (by nlinarith)
        (by positivity) (by positivity)
  calc
    _ ≤ (1 / ((4 * (n : ℝ) + 1) * ((n : ℝ) + 1))) /
        (2 * (n : ℝ) + 1) ^ 2 :=
      div_le_div_of_nonneg_right (Grothe.HaagerupWallis.coefficient_le n)
        (sq_nonneg _)
    _ = 1 / (((4 * (n : ℝ) + 1) * ((n : ℝ) + 1)) *
        (2 * (n : ℝ) + 1) ^ 2) := by rw [div_div]
    _ ≤ _ := one_div_le_one_div_of_le (by positivity) hden

/-- The rational comparison has an explicit nonnegative remainder. -/
theorem haagCoeff_weighted_le_diff (n : ℕ) (hn : 1 ≤ n) :
    haagCoeff n / (2 * (n : ℝ) + 1) ^ 2 ≤
      phaseWeightedMajorant n - phaseWeightedMajorant (n + 1) := by
  have hnpos : 0 < (n : ℝ) := by exact_mod_cast (show 0 < n by omega)
  have hnext : 0 < (n : ℝ) + 1 := by positivity
  have he : phaseWeightedMajorant n - phaseWeightedMajorant (n + 1) -
      1 / (16 * (n : ℝ) ^ 2 * ((n : ℝ) + 1) ^ 2) =
      1 / (48 * (n : ℝ) ^ 3 * ((n : ℝ) + 1) ^ 3) := by
    unfold phaseWeightedMajorant
    push_cast
    field_simp [hnpos.ne', hnext.ne']
    ring
  have hrem : 0 ≤ 1 / (48 * (n : ℝ) ^ 3 * ((n : ℝ) + 1) ^ 3) := by
    positivity
  rw [← he] at hrem
  exact (haagCoeff_weighted_le_rational n hn).trans (by linarith)

/-- A finite suffix telescopes before the infinite sum is introduced. -/
theorem sum_haagCoeff_weighted_tail_le_diff (N K : ℕ) (hN : 1 ≤ N) :
    (∑ j ∈ range K, haagCoeff (j + N) / (2 * ((j + N : ℕ) : ℝ) + 1) ^ 2) ≤
      phaseWeightedMajorant N - phaseWeightedMajorant (K + N) := by
  calc
    _ ≤ ∑ j ∈ range K,
        (phaseWeightedMajorant (j + N) - phaseWeightedMajorant ((j + 1) + N)) := by
      apply sum_le_sum
      intro j _hj
      have h := haagCoeff_weighted_le_diff (j + N) (by omega)
      rw [show j + N + 1 = (j + 1) + N by omega] at h
      exact h
    _ = _ := by
      simpa only [Nat.zero_add] using
        sum_range_sub' (fun j => phaseWeightedMajorant (j + N)) K

/-- The weighted coefficient suffix is summable even when its starting index is zero. -/
theorem haagCoeff_weighted_tail_summable (N : ℕ) :
    Summable (fun j : ℕ =>
      haagCoeff (j + N) / (2 * ((j + N : ℕ) : ℝ) + 1) ^ 2) := by
  have hbase : Summable (fun j : ℕ => haagCoeff (j + N)) :=
    (summable_nat_add_iff N).mpr summable_haagCoeff.of_abs
  refine hbase.of_nonneg_of_le (fun _ => div_nonneg (haagCoeff_nonneg _) (sq_nonneg _)) ?_
  intro j
  apply div_le_self (haagCoeff_nonneg _)
  have hj : 0 ≤ ((j + N : ℕ) : ℝ) := Nat.cast_nonneg _
  nlinarith [sq_nonneg ((j + N : ℕ) : ℝ)]

/-- The complete inverse-degree-weighted Wallis suffix has a cubic rational cap. -/
theorem haagCoeff_weighted_tail_le (N : ℕ) (hN : 1 ≤ N) :
    (∑' j : ℕ, haagCoeff (j + N) / (2 * ((j + N : ℕ) : ℝ) + 1) ^ 2) ≤
      1 / (48 * (N : ℝ) ^ 3) := by
  apply Real.tsum_le_of_sum_range_le
    (fun _ => div_nonneg (haagCoeff_nonneg _) (sq_nonneg _))
  intro K
  exact (sum_haagCoeff_weighted_tail_le_diff N K hN).trans
    (sub_le_self _ (phaseWeightedMajorant_nonneg _))

/-- Existing Gaussian phase energy, in the actual charge-one coefficient API. -/
theorem phase_chargeOneCoeff_energy (n : ℕ) :
    ‖chargeOneCoeff Grothe.Haag.phaseLp n‖ ^ 2 = haagCoeff n := by
  simpa only [chargeOneCoeff, chargeOneMode] using Grothe.Haag.phase_energy n

/-- Actual phase coefficients obey the summable inverse-square-degree budget. -/
theorem phase_weighted_tail_summable (N : ℕ) :
    Summable (fun j : ℕ => ‖chargeOneCoeff Grothe.Haag.phaseLp (j + N)‖ ^ 2 /
      (2 * ((j + N : ℕ) : ℝ) + 1) ^ 2) := by
  simpa only [phase_chargeOneCoeff_energy] using haagCoeff_weighted_tail_summable N

/-- The desired all-mode phase budget, with the original chaos grading. -/
theorem phase_weighted_tail_le (N : ℕ) (hN : 1 ≤ N) :
    (∑' j : ℕ, ‖chargeOneCoeff Grothe.Haag.phaseLp (j + N)‖ ^ 2 /
      (2 * ((j + N : ℕ) : ℝ) + 1) ^ 2) ≤ 1 / (48 * (N : ℝ) ^ 3) := by
  simpa only [phase_chargeOneCoeff_energy] using haagCoeff_weighted_tail_le N hN

end

end Grothe.HJM.Origin
