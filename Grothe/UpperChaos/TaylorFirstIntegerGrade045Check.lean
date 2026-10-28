import Grothe.UpperChaos.TaylorFirstIntegerGrade045Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade045Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade045Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade045Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade045Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade045Group004Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade045Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade045.size = 2162 := by
  simp only [firstCenterIntegerGrade045, Array.size_append, TaylorFirstIntegerGrade045Group000Check.group_length, TaylorFirstIntegerGrade045Group001Check.group_length, TaylorFirstIntegerGrade045Group002Check.group_length, TaylorFirstIntegerGrade045Group003Check.group_length, TaylorFirstIntegerGrade045Group004Check.group_length]

theorem grade_energy : firstCenterIntegerGrade045.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    4531727556500326032869467512448615210379328807370381862985373748741584235966226355725616998790003820776577705181184 := by
  change energy firstCenterIntegerGrade045 = _
  simp only [firstCenterIntegerGrade045, energy_append, TaylorFirstIntegerGrade045Group000Check.group_energy, TaylorFirstIntegerGrade045Group001Check.group_energy, TaylorFirstIntegerGrade045Group002Check.group_energy, TaylorFirstIntegerGrade045Group003Check.group_energy, TaylorFirstIntegerGrade045Group004Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade045Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade045Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade045Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
