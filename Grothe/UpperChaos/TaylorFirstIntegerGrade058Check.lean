import Grothe.UpperChaos.TaylorFirstIntegerGrade058Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade058Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade058Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade058Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade058Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade058Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade058Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade058Group006Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade058Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade058.size = 3540 := by
  simp only [firstCenterIntegerGrade058, Array.size_append, TaylorFirstIntegerGrade058Group000Check.group_length, TaylorFirstIntegerGrade058Group001Check.group_length, TaylorFirstIntegerGrade058Group002Check.group_length, TaylorFirstIntegerGrade058Group003Check.group_length, TaylorFirstIntegerGrade058Group004Check.group_length, TaylorFirstIntegerGrade058Group005Check.group_length, TaylorFirstIntegerGrade058Group006Check.group_length]

theorem grade_energy : firstCenterIntegerGrade058.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    1126452997921449840228077712381341174080046415247744200081718022709320310210949746092030599650337019772858986921984 := by
  change energy firstCenterIntegerGrade058 = _
  simp only [firstCenterIntegerGrade058, energy_append, TaylorFirstIntegerGrade058Group000Check.group_energy, TaylorFirstIntegerGrade058Group001Check.group_energy, TaylorFirstIntegerGrade058Group002Check.group_energy, TaylorFirstIntegerGrade058Group003Check.group_energy, TaylorFirstIntegerGrade058Group004Check.group_energy, TaylorFirstIntegerGrade058Group005Check.group_energy, TaylorFirstIntegerGrade058Group006Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade058Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade058Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade058Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
