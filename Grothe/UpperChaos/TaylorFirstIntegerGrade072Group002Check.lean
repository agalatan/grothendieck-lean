import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade072Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade072Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade072Part01024 = 1443036997950722079382088515849622660369930232491537246280196029075467685339208664013453570016366080438709518336 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade072Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade072Part01088 = 1377086830632119096129466570231072032283120407043833333463997287709484204513215199035362500739785769308420833280 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade072Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade072Part01152 = 1313400936621859716762391439869006350668342832102197990875189092343270778063233995964249523327002240029009379328 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade072Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade072Part01216 = 1238319898965075197752141379229247166940291890964149042230447041008669804800250417480607223856813000824950095872 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade072Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade072Part01280 = 1135005291915984988846856302204408989780495295619809415517518680692690759252170595682932395014497279591604813824 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade072Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade072Part01344 = 589203063602126281576327146290676567634388779843176036316300830783373589588281162448802781432482645671986331648 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade072Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade072Part01408 = 422740905111421290034528651343505256327986925202235971905639040566969381384626196674103296764478191674842939392 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade072Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade072Part01472 = 876625259453053975052284760347730558380616410218783871228744882733119383657563630004587525004659334845822926848 := by decide +kernel

theorem group_length : firstCenterIntegerGrade072Group002.size = 512 := by
  simp only [firstCenterIntegerGrade072Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade072Group002 = 8395419184252362625536084765365269582385172773485722907818032884913045586598549861304098816156084542385346838528 := by
  simp only [firstCenterIntegerGrade072Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade072Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
