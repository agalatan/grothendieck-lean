import Grothe.UpperChaos.TaylorFirstIntegerGrade031Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade031Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade031Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade031Group002Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade031Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade031.size = 1056 := by
  simp only [firstCenterIntegerGrade031, Array.size_append, TaylorFirstIntegerGrade031Group000Check.group_length, TaylorFirstIntegerGrade031Group001Check.group_length, TaylorFirstIntegerGrade031Group002Check.group_length]

theorem grade_energy : firstCenterIntegerGrade031.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    3269553108512280674987471298550443488279635633323095051496547999152062900095881657076919435034619006613701036867584 := by
  change energy firstCenterIntegerGrade031 = _
  simp only [firstCenterIntegerGrade031, energy_append, TaylorFirstIntegerGrade031Group000Check.group_energy, TaylorFirstIntegerGrade031Group001Check.group_energy, TaylorFirstIntegerGrade031Group002Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade031Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade031Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade031Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
