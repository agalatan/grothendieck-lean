import Grothe.UpperChaos.TaylorFirstIntegerGrade050Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade050Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade050Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade050Part00512 = 125135274673899379031031602816872150491072113346451355487064223623496071753065710898503787922817113153836987449344 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade050Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade050Part00576 = 40436971170242111258016571219418178931768172793857373112504572214287764912551962988197570953055403141175061774336 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade050Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade050Part00640 = 25168693416074274959476395116434719443823589714149916893561810698190528577979008918771499252822094121203230834688 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade050Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade050Part00704 = 15584635950724313045034994105553557973252041489564387028917470957061846445348029555162186093999417026753205370880 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade050Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade050Part00768 = 14035840101690765119138817785157762077488292710244319406737449474741955446870781628492116270408929406985254731776 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade050Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade050Part00832 = 3665438488024316580123573279243088615693131107146815959414650825062974659310188293747703096510051580614621003776 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade050Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade050Part00896 = 2127709613243608897359801212311111427883761958118970690034132704259060311633697925347604819736806213112681201664 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade050Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade050Part00960 = 1580587336502684886734989308061997210209567474029897966237470278377997992871893957886073428809158170119459831808 := by decide +kernel

theorem group_length : firstCenterIntegerGrade050Group001.size = 512 := by
  simp only [firstCenterIntegerGrade050Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade050Group001 = 227735150750401453776916744843052566171190670593563036544471780775478200099631274166108541838158972813800502198272 := by
  simp only [firstCenterIntegerGrade050Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade050Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade050Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade050Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
