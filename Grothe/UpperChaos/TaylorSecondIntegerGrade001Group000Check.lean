import Grothe.UpperChaos.TaylorSecondIntegerGrade001Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade001Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade001Part00000.size = 6 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade001Part00000 = 550713061837906894625835778427965193318348593259091797272875962787101193022679534209575315509571045124101300551680 := by decide +kernel

theorem group_length : secondCenterIntegerGrade001Group000.size = 6 := by
  simp only [secondCenterIntegerGrade001Group000, len0]

theorem group_energy : energy secondCenterIntegerGrade001Group000 = 550713061837906894625835778427965193318348593259091797272875962787101193022679534209575315509571045124101300551680 := by
  simp only [secondCenterIntegerGrade001Group000, sum0]

end Grothe.UpperChaos.TaylorSecondIntegerGrade001Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade001Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade001Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
