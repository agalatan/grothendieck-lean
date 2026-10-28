import Grothe.UpperChaos.TaylorFirstIntegerGrade049Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade049Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade049Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade049Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade049Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade049Group004Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade049Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade049.size = 2550 := by
  simp only [firstCenterIntegerGrade049, Array.size_append, TaylorFirstIntegerGrade049Group000Check.group_length, TaylorFirstIntegerGrade049Group001Check.group_length, TaylorFirstIntegerGrade049Group002Check.group_length, TaylorFirstIntegerGrade049Group003Check.group_length, TaylorFirstIntegerGrade049Group004Check.group_length]

theorem grade_energy : firstCenterIntegerGrade049.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    1784788953903613956365653483047832081843553093621288902354880181056017131754634203679132018643595925529825881620480 := by
  change energy firstCenterIntegerGrade049 = _
  simp only [firstCenterIntegerGrade049, energy_append, TaylorFirstIntegerGrade049Group000Check.group_energy, TaylorFirstIntegerGrade049Group001Check.group_energy, TaylorFirstIntegerGrade049Group002Check.group_energy, TaylorFirstIntegerGrade049Group003Check.group_energy, TaylorFirstIntegerGrade049Group004Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade049Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade049Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade049Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
