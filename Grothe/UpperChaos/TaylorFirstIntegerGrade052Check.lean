import Grothe.UpperChaos.TaylorFirstIntegerGrade052Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade052Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade052Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade052Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade052Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade052Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade052Group005Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade052Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade052.size = 2862 := by
  simp only [firstCenterIntegerGrade052, Array.size_append, TaylorFirstIntegerGrade052Group000Check.group_length, TaylorFirstIntegerGrade052Group001Check.group_length, TaylorFirstIntegerGrade052Group002Check.group_length, TaylorFirstIntegerGrade052Group003Check.group_length, TaylorFirstIntegerGrade052Group004Check.group_length, TaylorFirstIntegerGrade052Group005Check.group_length]

theorem grade_energy : firstCenterIntegerGrade052.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    1097978859314642057042722336095221447534972572830200235165539296575750077480497571731961943418548162174797385564160 := by
  change energy firstCenterIntegerGrade052 = _
  simp only [firstCenterIntegerGrade052, energy_append, TaylorFirstIntegerGrade052Group000Check.group_energy, TaylorFirstIntegerGrade052Group001Check.group_energy, TaylorFirstIntegerGrade052Group002Check.group_energy, TaylorFirstIntegerGrade052Group003Check.group_energy, TaylorFirstIntegerGrade052Group004Check.group_energy, TaylorFirstIntegerGrade052Group005Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade052Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade052Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade052Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
