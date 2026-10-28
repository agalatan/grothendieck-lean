import Grothe.UpperChaos.TaylorSecondIntegerGrade044Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade044Group004Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade044Part02048.size = 22 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade044Part02048 = 115467604442522007299521810973997563035844121430976318641988068895738401186904080256177631396628135088750592 := by decide +kernel

theorem group_length : secondCenterIntegerGrade044Group004.size = 22 := by
  simp only [secondCenterIntegerGrade044Group004, len0]

theorem group_energy : energy secondCenterIntegerGrade044Group004 = 115467604442522007299521810973997563035844121430976318641988068895738401186904080256177631396628135088750592 := by
  simp only [secondCenterIntegerGrade044Group004, sum0]

end Grothe.UpperChaos.TaylorSecondIntegerGrade044Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade044Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade044Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
