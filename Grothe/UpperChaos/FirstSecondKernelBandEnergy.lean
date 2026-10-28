import Grothe.UpperChaos.FirstCenterGradeBindings
import Grothe.UpperChaos.SecondCenterGradeBindings
import Grothe.UpperChaos.FirstSecondConditionalBandEnergy
import Grothe.UpperChaos.FirstSecondGradeEnergyTargets
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Draft replacement for both finite band arithmetic leaves, bound to the
actual first and second integer source arrays. The grade source/energy checks,
this module and its strict audits must all pass Lean before use.
Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.FirstSecondKernelBandEnergy
open FirstSecondGradeEnergyTargets

theorem first_check : ∀ k : Fin 6,
    PackedDyadic.gradedIntegerSum 91
      (fun q c d => if gradedMode q c d ∈ firstCenterBandModes k then
        firstCenterAt q c d ^ 2 else 0) = firstCenterBandIntegerEnergy k :=
  FirstSecondConditionalBandEnergy.first_of_grades firstGradeEnergy
    FirstCenterGradeBindings.all_grade_sums first_band_arithmetic

theorem second_check : ∀ k : Fin 4,
    PackedDyadic.gradedIntegerSum 46
      (fun q c d => if gradedMode q c d ∈ secondCenterBandModes k then
        secondCenterAt q c d ^ 2 else 0) = secondCenterBandIntegerEnergy k :=
  FirstSecondConditionalBandEnergy.second_of_grades secondGradeEnergy
    SecondCenterGradeBindings.all_grade_sums second_band_arithmetic

open Lean Elab Command
run_cmd do
  for target in #[``first_check, ``second_check] do
    let axioms ← Lean.collectAxioms target
    logInfo m!"Audit {target}: {axioms}"
    for ax in axioms do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
end Grothe.UpperChaos.FirstSecondKernelBandEnergy
