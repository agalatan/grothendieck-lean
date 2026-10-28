import Grothe.UpperChaos.TaylorFirstIntegerGrade084Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade084Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade084Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade084Part03072 = 14993382051182112928141445366057679465659462110842419170052638537430508877494968577841298965447351329770962944 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade084Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade084Part03136 = 12041743285229800291043065005814439272105329461083225786711812938628797529910566893156256549582943002604601344 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade084Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade084Part03200 = 23436328742130740677456777850317451477227457038593795827998870728358073518057509439126625465389685982363648 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade084Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade084Part03264 = 9554464473829097282134767050286201472460800240978423415471633108613247531749401429760890217493945050942406656 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade084Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade084Part03328 = 7528507477666227990189901385135440532982309022677666810867362016327644978750307513449531977606116532371324928 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade084Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade084Part03392 = 5831861773409488852450522948145022315973569209585388514567475276507215308380652174040969828437128702152671232 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade084Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade084Part03456 = 9786493216570483002411862894147857881384083749192934068633356299836960413655229045677266806290919458865152 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade084Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade084Part03520 = 4430280315237749684286740349520569415315654536565098122947910660128975231256938974880610845257909905840406528 := by decide +kernel

theorem group_length : firstCenterIntegerGrade084Group006.size = 512 := by
  simp only [firstCenterIntegerGrade084Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade084Group006 = 54413462198513178251926310745703817783855736122520008550515464764664584491474548301614362276097075129123602432 := by
  simp only [firstCenterIntegerGrade084Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade084Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
