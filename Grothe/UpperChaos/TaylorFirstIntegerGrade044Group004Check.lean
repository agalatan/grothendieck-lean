import Grothe.UpperChaos.TaylorFirstIntegerGrade044Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade044Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade044Part02048.size = 22 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade044Part02048 = 10235525212497511071968095119511313654010212223301823454413476816156509567245269618673853052841951920771825664 := by decide +kernel

theorem group_length : firstCenterIntegerGrade044Group004.size = 22 := by
  simp only [firstCenterIntegerGrade044Group004, len0]

theorem group_energy : energy firstCenterIntegerGrade044Group004 = 10235525212497511071968095119511313654010212223301823454413476816156509567245269618673853052841951920771825664 := by
  simp only [firstCenterIntegerGrade044Group004, sum0]

end Grothe.UpperChaos.TaylorFirstIntegerGrade044Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade044Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade044Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
