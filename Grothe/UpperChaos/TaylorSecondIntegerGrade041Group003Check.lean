import Grothe.UpperChaos.TaylorSecondIntegerGrade041Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade041Group003Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade041Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade041Part01536 = 692623966705356283941134968890878866838048733937354950813040833036035346106625003739288693868016295076691968 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade041Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade041Part01600 = 431998580846805798676012690702608436818815977304644117776064246650155658903355771264463346443412254515789824 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade041Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade041Part01664 = 457715393432006934269314000634849553275443849910370470394002192584619866220049819548635122607936462670266368 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade041Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade041Part01728 = 373407755516586254083389033508086528502066548450098430672071728402198420099587385819678681176106554242367488 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade041Part01792.size = 14 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade041Part01792 = 99189126386240000555447376742299125503336384463094426191275034331996863459126412376613927785544379237662720 := by decide +kernel

theorem group_length : secondCenterIntegerGrade041Group003.size = 270 := by
  simp only [secondCenterIntegerGrade041Group003, Array.size_append, len0, len1, len2, len3, len4]

theorem group_energy : energy secondCenterIntegerGrade041Group003 = 2054934822886995271525298070478722510937711494065562395846454035005006154788744392748679771881015945742778368 := by
  simp only [secondCenterIntegerGrade041Group003, energy_append, sum0, sum1, sum2, sum3, sum4]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade041Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade041Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade041Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
