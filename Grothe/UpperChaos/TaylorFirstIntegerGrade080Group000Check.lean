import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade080Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade080Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade080Part00000 = 4271950768770920996628516131220348063343534554151547035678784135750397431923421731175138718521595920080063954944 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade080Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade080Part00064 = 4831181600818886469615644262462806418016709816375654328479434649166831687465806874512253831653882798975781699584 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade080Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade080Part00128 = 5222210099287893871578192721267249993987488778496225543853483340170652665650707570991907692518108493886819139584 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade080Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade080Part00192 = 5012153408521571380780219154025654669086343493299378704106029154656225726430259093099243940306094017588613873664 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade080Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade080Part00256 = 46058529134639214120110354678400093466875923862902142983945069537718583406563706898726231280543720071151747072 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade080Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade080Part00320 = 4851443720245269380818552415807826836634990040417017868614600435083279587851153041202330415662175785634349711360 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade080Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade080Part00384 = 4564986252454302231775352081912548815234350658837035610721182802275610281187534869787058735483088638942600232960 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade080Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade080Part00448 = 4196551190066308658185803375775943446164992266996059055482087570320928374736256943590432678748146642721234223104 := by decide +kernel

theorem group_length : firstCenterIntegerGrade080Group000.size = 512 := by
  simp only [firstCenterIntegerGrade080Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade080Group000 = 32996535569299792203502390497150778335935285532435820289919547156961644338651703831257092244173636017900614582272 := by
  simp only [firstCenterIntegerGrade080Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade080Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
