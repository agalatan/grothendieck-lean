import Grothe.UpperChaos.TaylorFirstIntegerGrade065Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade065Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade065Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade065Part04096 = 67540565912854812681565629537341388119187290948001758520853620191521541753578306599970437762559856405905408 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade065Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade065Part04160 = 61563540011068365058535693843072482755542371875936032031074811632567817172452024205292777009270147185115136 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade065Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade065Part04224 = 32805366408550930284629462101051925797885160482353879317185199492343368505184865576562354726424387220668416 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade065Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade065Part04288 = 19062445984653841407781137346721247360433981700653877888408514969370890823685367218579018023986502301646848 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade065Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade065Part04352 = 8240445389088237387721358585362910049257472061718754704474455867045154982289024284976950857623113190866944 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade065Part04416.size = 6 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade065Part04416 = 6092011455707843206667965480919179587029050048030948974880331460841230164481126667724843027552967933820928 := by decide +kernel

theorem group_length : firstCenterIntegerGrade065Group008.size = 326 := by
  simp only [firstCenterIntegerGrade065Group008, Array.size_append, len0, len1, len2, len3, len4, len5]

theorem group_energy : energy firstCenterIntegerGrade065Group008 = 195304375161924030026901246894469133669335327116695251436876933613690003401670714553106381407416974238023680 := by
  simp only [firstCenterIntegerGrade065Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade065Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade065Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade065Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
