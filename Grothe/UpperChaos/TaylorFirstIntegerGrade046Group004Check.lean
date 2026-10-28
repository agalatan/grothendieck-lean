import Grothe.UpperChaos.TaylorFirstIntegerGrade046Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade046Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade046Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade046Part02048 = 10225593590713372503111340575078800797261884495773877283670701333264985934576540448219320102245212770954903552 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade046Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade046Part02112 = 5020013033040786598214541631610436486238121721620185724863174635120247122523930842441387878900040978959171584 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade046Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade046Part02176 = 6515894245275754428131034605196001502969320510082293407396243737192808602930111623381671909436891001794854912 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade046Part02240.size = 16 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade046Part02240 = 6980451248583197714257411580167769798600482292916701024329743433926139569761950343529169863743017001513123840 := by decide +kernel

theorem group_length : firstCenterIntegerGrade046Group004.size = 208 := by
  simp only [firstCenterIntegerGrade046Group004, Array.size_append, len0, len1, len2, len3]

theorem group_energy : energy firstCenterIntegerGrade046Group004 = 28741952117613111243714328392053008585069809020393057440259863139504181229792533257571549754325161753222053888 := by
  simp only [firstCenterIntegerGrade046Group004, energy_append, sum0, sum1, sum2, sum3]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade046Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade046Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade046Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
