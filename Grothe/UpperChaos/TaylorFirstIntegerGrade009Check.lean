import Grothe.UpperChaos.TaylorFirstIntegerGrade009Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade009Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade009Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade009.size = 110 := by
  simp only [firstCenterIntegerGrade009, TaylorFirstIntegerGrade009Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade009.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    40859792010708257518194454457411285640516359608206525473609269218800666325249623500215947481889065479121825096007680 := by
  change energy firstCenterIntegerGrade009 = _
  simp only [firstCenterIntegerGrade009, TaylorFirstIntegerGrade009Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade009Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade009Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
