import Grothe.UpperChaos.TaylorSecondIntegerGrade042Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade042Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade042Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade042Part00000 = 807637427697272985352339492633664026225888044100652580151207095797036583008331301734037772796278092172246384640 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade042Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade042Part00064 = 186419489837672936739623325712984381214212212094241942966005693072622244702821975935147030087015149893614305280 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade042Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade042Part00128 = 211719808172579476535954156015237257571456214643171068207936608372276028355987151606899257467419501128765669376 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade042Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade042Part00192 = 64694701163818315902924081731223125493483469283947723579627951269758693113086146601648484228885548749486555136 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade042Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade042Part00256 = 190761403791916645829027005911993556154378664561894712762072633572112606227691768125741783068234650716328689664 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade042Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade042Part00320 = 89104228446576643831561159500038815610801063858374321013761165006053958740661635929723999371274530711664590848 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade042Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade042Part00384 = 67763179480714385463704324164327211786909809860866650155113300954104981435722930303344913313252492270809120768 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade042Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade042Part00448 = 48402961543458711661793862538390848567737820512482804971339350891665363884385725424806886898087073366363078656 := by decide +kernel

theorem group_length : secondCenterIntegerGrade042Group000.size = 512 := by
  simp only [secondCenterIntegerGrade042Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade042Group000 = 1666503200134010101316927408207859222624867298915631803807063798935630459468688635661350127230447039009278394368 := by
  simp only [secondCenterIntegerGrade042Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade042Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade042Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade042Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
