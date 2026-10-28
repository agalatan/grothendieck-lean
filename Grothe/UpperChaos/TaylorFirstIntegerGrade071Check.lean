import Grothe.UpperChaos.TaylorFirstIntegerGrade071Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group007Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group008Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group009Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group010Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade071Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade071.size = 5256 := by
  simp only [firstCenterIntegerGrade071, Array.size_append, TaylorFirstIntegerGrade071Group000Check.group_length, TaylorFirstIntegerGrade071Group001Check.group_length, TaylorFirstIntegerGrade071Group002Check.group_length, TaylorFirstIntegerGrade071Group003Check.group_length, TaylorFirstIntegerGrade071Group004Check.group_length, TaylorFirstIntegerGrade071Group005Check.group_length, TaylorFirstIntegerGrade071Group006Check.group_length, TaylorFirstIntegerGrade071Group007Check.group_length, TaylorFirstIntegerGrade071Group008Check.group_length, TaylorFirstIntegerGrade071Group009Check.group_length, TaylorFirstIntegerGrade071Group010Check.group_length]

theorem grade_energy : firstCenterIntegerGrade071.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    155275444403752439795636910129123881146568951121609195049688375696934985045042863825196631498790773469693794582528 := by
  change energy firstCenterIntegerGrade071 = _
  simp only [firstCenterIntegerGrade071, energy_append, TaylorFirstIntegerGrade071Group000Check.group_energy, TaylorFirstIntegerGrade071Group001Check.group_energy, TaylorFirstIntegerGrade071Group002Check.group_energy, TaylorFirstIntegerGrade071Group003Check.group_energy, TaylorFirstIntegerGrade071Group004Check.group_energy, TaylorFirstIntegerGrade071Group005Check.group_energy, TaylorFirstIntegerGrade071Group006Check.group_energy, TaylorFirstIntegerGrade071Group007Check.group_energy, TaylorFirstIntegerGrade071Group008Check.group_energy, TaylorFirstIntegerGrade071Group009Check.group_energy, TaylorFirstIntegerGrade071Group010Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade071Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade071Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade071Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
