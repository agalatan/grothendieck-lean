import Grothe.UpperChaos.TaylorFirstIntegerGrade048Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade048Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade048Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade048Part00000 = 271308620346393876131791643014256306361364130106933096618360508240376633648783617698259230845663217032324387438592 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade048Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade048Part00064 = 217147149945582678183526498157157759415174844195422407365497696498940007945360189215808164033242295298126767980544 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade048Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade048Part00128 = 177541642666538902583967042435838647020083188145130988958196697352128273344454060708709669109294035666167360651264 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade048Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade048Part00192 = 418724110000025094260799160461690350738915576466432497968904551387609899141045671058201673619347637070144930316288 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade048Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade048Part00256 = 295743728708028931740204611921697541022158018575819829521013453554600377663339757548212091021098441873258985816064 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade048Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade048Part00320 = 285511376773014891435615495259345787788610637421626199299197426884368817168309564942627068336370214180507367768064 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade048Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade048Part00384 = 326180739582085928011209524838131169790411984199314785415796072329413199748900220486167477589143359845238317252608 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade048Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade048Part00448 = 179126199954201434344256336925073499041203451341332519817198805626637087384110587656384080465145745166674696339456 := by decide +kernel

theorem group_length : firstCenterIntegerGrade048Group000.size = 512 := by
  simp only [firstCenterIntegerGrade048Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade048Group000 = 2171283567975871736691370313013191061177921830452012324964165211874074296044303669314369455019304946132442813562880 := by
  simp only [firstCenterIntegerGrade048Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade048Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade048Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade048Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
