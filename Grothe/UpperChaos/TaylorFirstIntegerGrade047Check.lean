import Grothe.UpperChaos.TaylorFirstIntegerGrade047Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade047Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade047Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade047Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade047Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade047Group004Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade047Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade047.size = 2352 := by
  simp only [firstCenterIntegerGrade047, Array.size_append, TaylorFirstIntegerGrade047Group000Check.group_length, TaylorFirstIntegerGrade047Group001Check.group_length, TaylorFirstIntegerGrade047Group002Check.group_length, TaylorFirstIntegerGrade047Group003Check.group_length, TaylorFirstIntegerGrade047Group004Check.group_length]

theorem grade_energy : firstCenterIntegerGrade047.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    3144360336941826040383683617359225771465616608724169686135766157463629840319046484450948396146455018110794118201344 := by
  change energy firstCenterIntegerGrade047 = _
  simp only [firstCenterIntegerGrade047, energy_append, TaylorFirstIntegerGrade047Group000Check.group_energy, TaylorFirstIntegerGrade047Group001Check.group_energy, TaylorFirstIntegerGrade047Group002Check.group_energy, TaylorFirstIntegerGrade047Group003Check.group_energy, TaylorFirstIntegerGrade047Group004Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade047Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade047Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade047Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
