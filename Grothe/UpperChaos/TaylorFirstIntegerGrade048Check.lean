import Grothe.UpperChaos.TaylorFirstIntegerGrade048Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade048Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade048Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade048Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade048Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade048Group004Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade048Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade048.size = 2450 := by
  simp only [firstCenterIntegerGrade048, Array.size_append, TaylorFirstIntegerGrade048Group000Check.group_length, TaylorFirstIntegerGrade048Group001Check.group_length, TaylorFirstIntegerGrade048Group002Check.group_length, TaylorFirstIntegerGrade048Group003Check.group_length, TaylorFirstIntegerGrade048Group004Check.group_length]

theorem grade_energy : firstCenterIntegerGrade048.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    2385268555035792867206714957070420138855508343428799393329348575836879424036467428208896981521878939217280152633344 := by
  change energy firstCenterIntegerGrade048 = _
  simp only [firstCenterIntegerGrade048, energy_append, TaylorFirstIntegerGrade048Group000Check.group_energy, TaylorFirstIntegerGrade048Group001Check.group_energy, TaylorFirstIntegerGrade048Group002Check.group_energy, TaylorFirstIntegerGrade048Group003Check.group_energy, TaylorFirstIntegerGrade048Group004Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade048Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade048Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade048Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
