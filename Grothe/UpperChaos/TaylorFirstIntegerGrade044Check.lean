import Grothe.UpperChaos.TaylorFirstIntegerGrade044Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade044Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade044Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade044Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade044Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade044Group004Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade044Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade044.size = 2070 := by
  simp only [firstCenterIntegerGrade044, Array.size_append, TaylorFirstIntegerGrade044Group000Check.group_length, TaylorFirstIntegerGrade044Group001Check.group_length, TaylorFirstIntegerGrade044Group002Check.group_length, TaylorFirstIntegerGrade044Group003Check.group_length, TaylorFirstIntegerGrade044Group004Check.group_length]

theorem grade_energy : firstCenterIntegerGrade044.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    4715689764595010951278906984376526982564154805336111991739035523858833402799499403076184939796932809257416115879936 := by
  change energy firstCenterIntegerGrade044 = _
  simp only [firstCenterIntegerGrade044, energy_append, TaylorFirstIntegerGrade044Group000Check.group_energy, TaylorFirstIntegerGrade044Group001Check.group_energy, TaylorFirstIntegerGrade044Group002Check.group_energy, TaylorFirstIntegerGrade044Group003Check.group_energy, TaylorFirstIntegerGrade044Group004Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade044Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade044Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade044Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
