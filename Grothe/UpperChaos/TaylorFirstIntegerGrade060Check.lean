import Grothe.UpperChaos.TaylorFirstIntegerGrade060Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade060Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade060Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade060Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade060Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade060Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade060Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade060Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade060Group007Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade060Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade060.size = 3782 := by
  simp only [firstCenterIntegerGrade060, Array.size_append, TaylorFirstIntegerGrade060Group000Check.group_length, TaylorFirstIntegerGrade060Group001Check.group_length, TaylorFirstIntegerGrade060Group002Check.group_length, TaylorFirstIntegerGrade060Group003Check.group_length, TaylorFirstIntegerGrade060Group004Check.group_length, TaylorFirstIntegerGrade060Group005Check.group_length, TaylorFirstIntegerGrade060Group006Check.group_length, TaylorFirstIntegerGrade060Group007Check.group_length]

theorem grade_energy : firstCenterIntegerGrade060.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    899014640756017783586156321128215372020588089148707271174168954327487270121919277050262750881905260016823978426368 := by
  change energy firstCenterIntegerGrade060 = _
  simp only [firstCenterIntegerGrade060, energy_append, TaylorFirstIntegerGrade060Group000Check.group_energy, TaylorFirstIntegerGrade060Group001Check.group_energy, TaylorFirstIntegerGrade060Group002Check.group_energy, TaylorFirstIntegerGrade060Group003Check.group_energy, TaylorFirstIntegerGrade060Group004Check.group_energy, TaylorFirstIntegerGrade060Group005Check.group_energy, TaylorFirstIntegerGrade060Group006Check.group_energy, TaylorFirstIntegerGrade060Group007Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade060Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade060Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade060Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
