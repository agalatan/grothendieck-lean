import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade078Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade078Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade078Part04096 = 94866770233322816215404466956731928671972950422802212147929032996856789575747016796024558913110177740750848 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade078Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade078Part04160 = 40015494333865856719643166285002323045191169282086506741479819795366294899570874154450324625302001121492992 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade078Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade078Part04224 = 118956259857752141328342650869290166868826865705469748811036361292847078147524248476411898597362130325864448 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade078Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade078Part04288 = 100954374521596496194677251488890963923968612537194645867651724443610531128359784529411007647272780330696704 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade078Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade078Part04352 = 86197994131750399013571520001728499535974102379884553870644820520116852802172314968186764830649013007024128 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade078Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade078Part04416 = 24946197228348472142148336513479813130702515312029791388239911843715385893089319597641171804425371231715328 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade078Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade078Part04480 = 52972294454653518722127041720429576982638577467283415671941405998197717066322396058220909411340998588497920 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade078Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade078Part04544 = 68989192430273753898214834513284365000359266487318198805886167448912193831960736458909932454963789986529280 := by decide +kernel

theorem group_length : firstCenterIntegerGrade078Group008.size = 512 := by
  simp only [firstCenterIntegerGrade078Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade078Group008 = 587898577191563454234129268348837637159634059594069073304809244339622843344746691039256568284426262332571648 := by
  simp only [firstCenterIntegerGrade078Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade078Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
