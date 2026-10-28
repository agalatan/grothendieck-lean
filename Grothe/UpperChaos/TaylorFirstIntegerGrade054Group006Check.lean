import Grothe.UpperChaos.TaylorFirstIntegerGrade054Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade054Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade054Part03072.size = 8 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade054Part03072 = 1176332408860704763907102328435220678401241519851937928232516236632972364931705868287272155164365833205972992 := by decide +kernel

theorem group_length : firstCenterIntegerGrade054Group006.size = 8 := by
  simp only [firstCenterIntegerGrade054Group006, len0]

theorem group_energy : energy firstCenterIntegerGrade054Group006 = 1176332408860704763907102328435220678401241519851937928232516236632972364931705868287272155164365833205972992 := by
  simp only [firstCenterIntegerGrade054Group006, sum0]

end Grothe.UpperChaos.TaylorFirstIntegerGrade054Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade054Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade054Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
