import Grothe.UpperChaos.TaylorFirstIntegerGrade041Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade041Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade041Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade041Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade041Group003Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade041Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade041.size = 1806 := by
  simp only [firstCenterIntegerGrade041, Array.size_append, TaylorFirstIntegerGrade041Group000Check.group_length, TaylorFirstIntegerGrade041Group001Check.group_length, TaylorFirstIntegerGrade041Group002Check.group_length, TaylorFirstIntegerGrade041Group003Check.group_length]

theorem grade_energy : firstCenterIntegerGrade041.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    2457383078546925470567730261835496743364658391650819197989539598798399371773504905964634057295051046798512132980736 := by
  change energy firstCenterIntegerGrade041 = _
  simp only [firstCenterIntegerGrade041, energy_append, TaylorFirstIntegerGrade041Group000Check.group_energy, TaylorFirstIntegerGrade041Group001Check.group_energy, TaylorFirstIntegerGrade041Group002Check.group_energy, TaylorFirstIntegerGrade041Group003Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade041Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade041Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade041Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
