import Grothe.UpperChaos.TaylorFirstIntegerGrade054Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade054Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade054Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade054Part00000 = 197226642256003174059180184094333828883847887731898940325048363692479166506508455132670322383820765360049979654144 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade054Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade054Part00064 = 149043782814869577961844189750167757659929239299660106865299156161340990052763574282817279776972052602372451467264 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade054Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade054Part00128 = 131191006156515422984709788212085887973630884352324258723252387130893715401961154444744408223576387121365064351744 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade054Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade054Part00192 = 111866500120802527605154627859436384361329695692652176124968803478653704091732453899365960765802859834998123397120 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade054Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade054Part00256 = 101357267425725906760316178730133919444034820628276886492313146494528794118514787582832570846307933208512288522240 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade054Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade054Part00320 = 95104231037202241514268129486110066177615022371055188518286723259162506984950706719959388833439436379550803558400 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade054Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade054Part00384 = 123835887255537120051223415141029972829148564389830091401032216699931818919635427658912183632316526722079006916608 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade054Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade054Part00448 = 72355165971192393342379177150811806630098210329684016753821716209891910641098791684512917468281655398710300901376 := by decide +kernel

theorem group_length : firstCenterIntegerGrade054Group000.size = 512 := by
  simp only [firstCenterIntegerGrade054Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade054Group000 = 981980483037848364279075690424109623959634324795381665204022513126882606717165351405815031930517616627638018768896 := by
  simp only [firstCenterIntegerGrade054Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade054Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade054Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade054Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
