import Grothe.UpperChaos.TaylorFirstIntegerGrade005Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade005Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade005Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade005.size = 42 := by
  simp only [firstCenterIntegerGrade005, TaylorFirstIntegerGrade005Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade005.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    2014487649678989884785356889313678106559150172390741825918546142866694499720754178309217938510410730063480832422576128 := by
  change energy firstCenterIntegerGrade005 = _
  simp only [firstCenterIntegerGrade005, TaylorFirstIntegerGrade005Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade005Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade005Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
