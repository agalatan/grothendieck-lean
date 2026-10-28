import Grothe.UpperChaos.TaylorFirstIntegerGrade050Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade050Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade050Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade050Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade050Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade050Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade050Group005Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade050Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade050.size = 2652 := by
  simp only [firstCenterIntegerGrade050, Array.size_append, TaylorFirstIntegerGrade050Group000Check.group_length, TaylorFirstIntegerGrade050Group001Check.group_length, TaylorFirstIntegerGrade050Group002Check.group_length, TaylorFirstIntegerGrade050Group003Check.group_length, TaylorFirstIntegerGrade050Group004Check.group_length, TaylorFirstIntegerGrade050Group005Check.group_length]

theorem grade_energy : firstCenterIntegerGrade050.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    1386983868378566425857568602844174979941724298000063763401432055937564219890500546383061722766980980958392701943808 := by
  change energy firstCenterIntegerGrade050 = _
  simp only [firstCenterIntegerGrade050, energy_append, TaylorFirstIntegerGrade050Group000Check.group_energy, TaylorFirstIntegerGrade050Group001Check.group_energy, TaylorFirstIntegerGrade050Group002Check.group_energy, TaylorFirstIntegerGrade050Group003Check.group_energy, TaylorFirstIntegerGrade050Group004Check.group_energy, TaylorFirstIntegerGrade050Group005Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade050Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade050Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade050Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
