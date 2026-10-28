import Grothe.UpperChaos.TaylorFirstIntegerGrade037Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade037Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade037Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade037Group002Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade037Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade037.size = 1482 := by
  simp only [firstCenterIntegerGrade037, Array.size_append, TaylorFirstIntegerGrade037Group000Check.group_length, TaylorFirstIntegerGrade037Group001Check.group_length, TaylorFirstIntegerGrade037Group002Check.group_length]

theorem grade_energy : firstCenterIntegerGrade037.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    1896912567556506946431029102717027911498508285861107025820682312211824851740287301290347012424956748904452291821568 := by
  change energy firstCenterIntegerGrade037 = _
  simp only [firstCenterIntegerGrade037, energy_append, TaylorFirstIntegerGrade037Group000Check.group_energy, TaylorFirstIntegerGrade037Group001Check.group_energy, TaylorFirstIntegerGrade037Group002Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade037Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade037Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade037Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
