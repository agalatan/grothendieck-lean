import Grothe.UpperChaos.TaylorFirstIntegerGrade088Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade088Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade088Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade088Part02560 = 49089814806510302770115764107731949590860110383210765984964495628439342673325736435554446966515570235905409024 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade088Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade088Part02624 = 10252564391599642445314954251079042672676207790482858114691182101630364161117416700044207616411382319153152 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade088Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade088Part02688 = 40446454632388707136671406255815390909186383617431789172167328757858955665984320621784402621068898351439675392 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade088Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade088Part02752 = 33266797482796756337788131842638935482313737765086608333152159021830307123929449229305879278312131097016664064 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade088Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade088Part02816 = 5609424890948762276611742804596357637746810844150044302099489719956705569280005391912451019980544384685834240 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade088Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade088Part02880 = 21780392053743103798268117454191310933350075593433938387234614584982580908452627378793361853020222438095454208 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade088Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade088Part02944 = 22654378030536738813517483322929836561828609413996689857275622800003228086230585898096851092875777789178937344 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade088Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade088Part03008 = 18848995589907762518205574587371510765263880906157365169491014683596150776740490981316110826956561724366389248 := by decide +kernel

theorem group_length : firstCenterIntegerGrade088Group005.size = 512 := by
  simp only [firstCenterIntegerGrade088Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade088Group005 = 191706510051223733293623535329526370923222284731257684064499416378768901168104333353463547866346117403007516672 := by
  simp only [firstCenterIntegerGrade088Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade088Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
