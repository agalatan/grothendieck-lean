import Grothe.UpperChaos.TaylorFirstIntegerGrade015Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade015Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade015Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade015.size = 272 := by
  simp only [firstCenterIntegerGrade015, TaylorFirstIntegerGrade015Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade015.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    13554066588787562562592532119912945125602363718312816945217062551026276302572249820943324681051767266022034293915648 := by
  change energy firstCenterIntegerGrade015 = _
  simp only [firstCenterIntegerGrade015, TaylorFirstIntegerGrade015Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade015Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade015Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade015Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
