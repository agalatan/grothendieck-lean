import Grothe.UpperChaos.TaylorFirstIntegerGrade005Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade005Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade005Part00000.size = 42 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade005Part00000 = 2014487649678989884785356889313678106559150172390741825918546142866694499720754178309217938510410730063480832422576128 := by decide +kernel

theorem group_length : firstCenterIntegerGrade005Group000.size = 42 := by
  simp only [firstCenterIntegerGrade005Group000, len0]

theorem group_energy : energy firstCenterIntegerGrade005Group000 = 2014487649678989884785356889313678106559150172390741825918546142866694499720754178309217938510410730063480832422576128 := by
  simp only [firstCenterIntegerGrade005Group000, sum0]

end Grothe.UpperChaos.TaylorFirstIntegerGrade005Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade005Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade005Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
