import Grothe.UpperChaos.TaylorFirstSecondSource
import Grothe.UpperChaos.TaylorFirstSecondBandDefs
import Grothe.UpperChaos.CenterBandGradeAssembly
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Exact first/second center band statements, conditional on the complete
actual-source grade sums and independent finite target arithmetic. These
hypotheses have not been discharged here. No native check is used.
Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.FirstSecondConditionalBandEnergy

theorem first_of_grades (grade : ℕ → ℤ)
    (hgrade : ∀ q < 91,
      (∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1), firstCenterAt q c d ^ 2) = grade q)
    (htarget : ∀ k : Fin 6,
      (∑ q ∈ Finset.range 91,
        if firstCenterBandLo k < 2*q+1 ∧ 2*q+1 ≤ firstCenterBandHi k then grade q else 0) =
          firstCenterBandIntegerEnergy k) :
    ∀ k : Fin 6, PackedDyadic.gradedIntegerSum 91
      (fun q c d => if gradedMode q c d ∈ firstCenterBandModes k then
        firstCenterAt q c d ^ 2 else 0) = firstCenterBandIntegerEnergy k := by
  intro k
  change PackedDyadic.gradedIntegerSum 91
      (fun q c d => if firstCenterBandLo k < (bideg (gradedMode q c d)).1 +
        (bideg (gradedMode q c d)).2 ∧ (bideg (gradedMode q c d)).1 +
        (bideg (gradedMode q c d)).2 ≤ firstCenterBandHi k then
        firstCenterAt q c d ^ 2 else 0) = firstCenterBandIntegerEnergy k
  rw [CenterBandGradeAssembly.band_of_grades 91 (firstCenterBandLo k)
    (firstCenterBandHi k) firstCenterAt grade hgrade]
  exact htarget k

theorem second_of_grades (grade : ℕ → ℤ)
    (hgrade : ∀ q < 46,
      (∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1), secondCenterAt q c d ^ 2) = grade q)
    (htarget : ∀ k : Fin 4,
      (∑ q ∈ Finset.range 46,
        if secondCenterBandLo k < 2*q+1 ∧ 2*q+1 ≤ secondCenterBandHi k then grade q else 0) =
          secondCenterBandIntegerEnergy k) :
    ∀ k : Fin 4, PackedDyadic.gradedIntegerSum 46
      (fun q c d => if gradedMode q c d ∈ secondCenterBandModes k then
        secondCenterAt q c d ^ 2 else 0) = secondCenterBandIntegerEnergy k := by
  intro k
  change PackedDyadic.gradedIntegerSum 46
      (fun q c d => if secondCenterBandLo k < (bideg (gradedMode q c d)).1 +
        (bideg (gradedMode q c d)).2 ∧ (bideg (gradedMode q c d)).1 +
        (bideg (gradedMode q c d)).2 ≤ secondCenterBandHi k then
        secondCenterAt q c d ^ 2 else 0) = secondCenterBandIntegerEnergy k
  rw [CenterBandGradeAssembly.band_of_grades 46 (secondCenterBandLo k)
    (secondCenterBandHi k) secondCenterAt grade hgrade]
  exact htarget k

open Lean Elab Command
run_cmd do
  for target in #[``first_of_grades, ``second_of_grades] do
    let axioms ← Lean.collectAxioms target
    logInfo m!"Audit {target}: {axioms}"
    for ax in axioms do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
end Grothe.UpperChaos.FirstSecondConditionalBandEnergy
