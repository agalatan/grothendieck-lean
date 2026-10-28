import Grothe.UpperChaos.TaylorSecondIntegerGrade031Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade031Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade031Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade031Part00000 = 2124501709898266737423717128890318861590152152120217303769527300323380914039470373008272223422131883119401238528 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade031Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade031Part00064 = 2699964208024857773855903691621025924356934664671786533309850995309731695465423048979895665578744858301075292160 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade031Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade031Part00128 = 1416712929427519213870520495876036108896303827412307220631720571164824422290477358568193664535900984577567490048 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade031Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade031Part00192 = 588427963445428815952286151907010865948077136495788469295744781496132330939949925956761176593175248748779929600 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade031Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade031Part00256 = 262468405596095840552719179385484280826145852404553683373331193436109118194496875131825927961701522469747163136 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade031Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade031Part00320 = 254737418930517770698353787878314553083655299502962889579884618418249768565069533337273268304236246792742633472 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade031Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade031Part00384 = 152420462251585679807639554435663743605230762966466362038311529939850745761648141712659132944538050413128056832 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade031Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade031Part00448 = 215974408780331562555877232015858140280352310726799988168672695926197519080883285873643288408934253642739875840 := by decide +kernel

theorem group_length : secondCenterIntegerGrade031Group000.size = 512 := by
  simp only [secondCenterIntegerGrade031Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade031Group000 = 7715207506354603394717017222009712478586852006300882450167043686014476514337418542568524347749363048065181679616 := by
  simp only [secondCenterIntegerGrade031Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade031Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade031Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade031Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
