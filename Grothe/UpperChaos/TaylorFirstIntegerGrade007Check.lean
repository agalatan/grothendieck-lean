import Grothe.UpperChaos.TaylorFirstIntegerGrade007Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade007Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade007Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade007.size = 72 := by
  simp only [firstCenterIntegerGrade007, TaylorFirstIntegerGrade007Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade007.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    47161426317200834848631814307950394584863009321000778365524615922346922627798995956410304848746007710432191276122112 := by
  change energy firstCenterIntegerGrade007 = _
  simp only [firstCenterIntegerGrade007, TaylorFirstIntegerGrade007Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade007Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade007Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
