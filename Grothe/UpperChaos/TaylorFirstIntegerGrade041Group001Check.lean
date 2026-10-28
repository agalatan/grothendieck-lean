import Grothe.UpperChaos.TaylorFirstIntegerGrade041Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade041Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade041Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade041Part00512 = 61261066719566892829571159210014257614735589409816412630837731302453547273009567041937312553211072067745209122816 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade041Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade041Part00576 = 24296688562490634783032841070230015875244325482074241556335418697480733722546959053596618521779514759559304445952 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade041Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade041Part00640 = 16585799786781359405929217489485995689770529272402063469451810369094617043240906529168131124892465972654307803136 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade041Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade041Part00704 = 5369977968683129618800680746650432857255055069273835442276258000806698386895784929147583530025162961953948172288 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade041Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade041Part00768 = 3062104643976418817464510028059785389695738604422525644743488644998915420859552977144559341368361606054953353216 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade041Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade041Part00832 = 846705454338973555196121888084086574073600664428100315542462747665841484957098588403381852366074443967752044544 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade041Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade041Part00896 = 522387113754315181327853369154293060664680662855644203802151944587703091183024963423042466954878588562240962560 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade041Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade041Part00960 = 187132206131254910130475660586411042017032835113844693914109541923712447457023466619129291582710870842389037056 := by decide +kernel

theorem group_length : firstCenterIntegerGrade041Group001.size = 512 := by
  simp only [firstCenterIntegerGrade041Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade041Group001 = 112131862455722979101452859462265278103456552000386667956903431249011768870149917549439758682180241271340104941568 := by
  simp only [firstCenterIntegerGrade041Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade041Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade041Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade041Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
