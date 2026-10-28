import Grothe.UpperChaos.TaylorFirstIntegerGrade050Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade050Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade050Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade050Part02560 = 2856174369835409073300474668620392477644969286874120902758099295835268983993556353709492106613268265683648512 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade050Part02624.size = 28 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade050Part02624 = 3673556303995366014409905104965639063398839731822526482579658506525195538040882129594197526318587654988365824 := by decide +kernel

theorem group_length : firstCenterIntegerGrade050Group005.size = 92 := by
  simp only [firstCenterIntegerGrade050Group005, Array.size_append, len0, len1]

theorem group_energy : energy firstCenterIntegerGrade050Group005 = 6529730673830775087710379773586031541043809018696647385337757802360464522034438483303689632931855920672014336 := by
  simp only [firstCenterIntegerGrade050Group005, energy_append, sum0, sum1]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade050Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade050Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade050Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
