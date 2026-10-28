import Grothe.UpperChaos.CenterGradeEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Generic exact band energy from per-grade integer sums of the same source.
Grade sums are explicit hypotheses. This module assumes no bounds, copies no
coefficient table, and contains no native numerical check.
Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.CenterBandGradeAssembly

/-- A degree filter is constant within each actual source grade. -/
theorem band_of_grades (N lo hi : ℕ) (a : ℕ → ℕ → ℕ → ℤ) (grade : ℕ → ℤ)
    (hgrade : ∀ q < N,
      (∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1), a q c d ^ 2) = grade q) :
    PackedDyadic.gradedIntegerSum N
      (fun q c d => if lo < (bideg (gradedMode q c d)).1 + (bideg (gradedMode q c d)).2 ∧
        (bideg (gradedMode q c d)).1 + (bideg (gradedMode q c d)).2 ≤ hi
        then a q c d ^ 2 else 0) =
    ∑ q ∈ Finset.range N, if lo < 2*q+1 ∧ 2*q+1 ≤ hi then grade q else 0 := by
  rw [CenterGradeEnergy.graded_band_sum]
  apply Finset.sum_congr rfl
  intro q hq
  by_cases h : lo < 2*q+1 ∧ 2*q+1 ≤ hi
  · rw [if_pos h, if_pos h, hgrade q (Finset.mem_range.mp hq)]
  · rw [if_neg h, if_neg h]

open Lean Elab Command
run_cmd do
  let target := ``band_of_grades
  let axioms ← Lean.collectAxioms target
  logInfo m!"Audit {target}: {axioms}"
  for ax in axioms do
    unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
      throwError m!"{target} has forbidden axiom {ax}"
end Grothe.UpperChaos.CenterBandGradeAssembly
