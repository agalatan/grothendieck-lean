import Grothe.UpperChaos.TaylorFirstIntegerGrade068Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade068Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade068Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade068Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade068Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade068Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade068Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade068Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade068Group007Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade068Group008Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade068Group009Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade068Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade068.size = 4830 := by
  simp only [firstCenterIntegerGrade068, Array.size_append, TaylorFirstIntegerGrade068Group000Check.group_length, TaylorFirstIntegerGrade068Group001Check.group_length, TaylorFirstIntegerGrade068Group002Check.group_length, TaylorFirstIntegerGrade068Group003Check.group_length, TaylorFirstIntegerGrade068Group004Check.group_length, TaylorFirstIntegerGrade068Group005Check.group_length, TaylorFirstIntegerGrade068Group006Check.group_length, TaylorFirstIntegerGrade068Group007Check.group_length, TaylorFirstIntegerGrade068Group008Check.group_length, TaylorFirstIntegerGrade068Group009Check.group_length]

theorem grade_energy : firstCenterIntegerGrade068.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    260717342148571892554287741496385081619374287222185447152319749268350859450071848401550159327773696472276852015104 := by
  change energy firstCenterIntegerGrade068 = _
  simp only [firstCenterIntegerGrade068, energy_append, TaylorFirstIntegerGrade068Group000Check.group_energy, TaylorFirstIntegerGrade068Group001Check.group_energy, TaylorFirstIntegerGrade068Group002Check.group_energy, TaylorFirstIntegerGrade068Group003Check.group_energy, TaylorFirstIntegerGrade068Group004Check.group_energy, TaylorFirstIntegerGrade068Group005Check.group_energy, TaylorFirstIntegerGrade068Group006Check.group_energy, TaylorFirstIntegerGrade068Group007Check.group_energy, TaylorFirstIntegerGrade068Group008Check.group_energy, TaylorFirstIntegerGrade068Group009Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade068Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade068Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade068Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
