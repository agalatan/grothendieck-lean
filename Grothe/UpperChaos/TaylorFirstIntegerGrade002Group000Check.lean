import Grothe.UpperChaos.TaylorFirstIntegerGrade002Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade002Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade002Part00000.size = 12 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade002Part00000 = 12519390462579572764674714821174980623286038625699712445560354694735921877639283632717272019355817384764306919201439744 := by decide +kernel

theorem group_length : firstCenterIntegerGrade002Group000.size = 12 := by
  simp only [firstCenterIntegerGrade002Group000, len0]

theorem group_energy : energy firstCenterIntegerGrade002Group000 = 12519390462579572764674714821174980623286038625699712445560354694735921877639283632717272019355817384764306919201439744 := by
  simp only [firstCenterIntegerGrade002Group000, sum0]

end Grothe.UpperChaos.TaylorFirstIntegerGrade002Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade002Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade002Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
