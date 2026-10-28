import Grothe.UpperChaos.TaylorFirstIntegerGrade032Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade032Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade032Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade032Group002Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade032Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade032.size = 1122 := by
  simp only [firstCenterIntegerGrade032, Array.size_append, TaylorFirstIntegerGrade032Group000Check.group_length, TaylorFirstIntegerGrade032Group001Check.group_length, TaylorFirstIntegerGrade032Group002Check.group_length]

theorem grade_energy : firstCenterIntegerGrade032.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    2562077471174606763631270748865652739531441784114251611062766131110775306853074124518758849038482906707867560050688 := by
  change energy firstCenterIntegerGrade032 = _
  simp only [firstCenterIntegerGrade032, energy_append, TaylorFirstIntegerGrade032Group000Check.group_energy, TaylorFirstIntegerGrade032Group001Check.group_energy, TaylorFirstIntegerGrade032Group002Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade032Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade032Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade032Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
