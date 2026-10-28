import Grothe.UpperChaos.TaylorSecondIntegerGrade003Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade003Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade003Part00000.size = 20 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade003Part00000 = 1100165202386148327378430294547552660209207074630812594564882219328913502996520625052712471958922712991958264971264 := by decide +kernel

theorem group_length : secondCenterIntegerGrade003Group000.size = 20 := by
  simp only [secondCenterIntegerGrade003Group000, len0]

theorem group_energy : energy secondCenterIntegerGrade003Group000 = 1100165202386148327378430294547552660209207074630812594564882219328913502996520625052712471958922712991958264971264 := by
  simp only [secondCenterIntegerGrade003Group000, sum0]

end Grothe.UpperChaos.TaylorSecondIntegerGrade003Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade003Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade003Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
