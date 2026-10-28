import Grothe.UpperChaos.GradedHermiteIntegerEnergy
import Mathlib.Tactic

/-! Generic grade decomposition of exact center band energy.
This does not parse or certify any concrete center. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.CenterGradeEnergy
open Grothe.UpperChaos

theorem gradedMode_total_degree (q c d : ℕ) (hc : c < q + 2) (hd : d < q + 1) :
    (bideg (gradedMode q c d)).1 + (bideg (gradedMode q c d)).2 = 2*q+1 := by
  dsimp [gradedMode, bideg]
  omega

/-- The grade filter is constant throughout the grade. -/
theorem graded_band_sum (N lo hi : ℕ) (f : ℕ → ℕ → ℕ → ℤ) :
    PackedDyadic.gradedIntegerSum N
      (fun q c d => if lo < (bideg (gradedMode q c d)).1 + (bideg (gradedMode q c d)).2 ∧
        (bideg (gradedMode q c d)).1 + (bideg (gradedMode q c d)).2 ≤ hi
        then f q c d else 0) =
    ∑ q ∈ Finset.range N, if lo < 2*q+1 ∧ 2*q+1 ≤ hi then
      ∑ c ∈ Finset.range (q+2), ∑ d ∈ Finset.range (q+1), f q c d else 0 := by
  rw [PackedDyadic.gradedIntegerSum_eq]
  apply Finset.sum_congr rfl
  intro q hq
  by_cases h : lo < 2*q+1 ∧ 2*q+1 ≤ hi
  · rw [if_pos h]
    apply Finset.sum_congr rfl
    intro c hc
    apply Finset.sum_congr rfl
    intro d hd
    rw [gradedMode_total_degree q c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    simp [h]
  · rw [if_neg h]
    apply Finset.sum_eq_zero
    intro c hc
    apply Finset.sum_eq_zero
    intro d hd
    rw [gradedMode_total_degree q c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    simp [h]

#print axioms gradedMode_total_degree
#print axioms graded_band_sum
end Grothe.UpperChaos.CenterGradeEnergy
