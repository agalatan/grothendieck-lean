import Grothe.UpperChaos.TaylorFirstIntegerGrade019Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade019Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade019Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade019.size = 420 := by
  simp only [firstCenterIntegerGrade019, TaylorFirstIntegerGrade019Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade019.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    9176849846406547049435933435728516151392054955099003891628794748093726223998346081792825648384956990414810339344384 := by
  change energy firstCenterIntegerGrade019 = _
  simp only [firstCenterIntegerGrade019, TaylorFirstIntegerGrade019Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade019Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade019Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade019Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
