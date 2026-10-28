import Grothe.UpperChaos.TaylorFirstIntegerGrade069Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade069Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade069Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade069Part03584 = 393203643898797811123283634909310565085907209545390378847916448776262541141903372533777241401218886688309248 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade069Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade069Part03648 = 325395177823199002892962608917327889444774030193123502000195033642052328724104871121930217649019070439227392 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade069Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade069Part03712 = 279058224963824662053850186555232110599601621688700298545071782497163043229470157065244342152333498590953472 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade069Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade069Part03776 = 239053314952748918852820253081939545692459793421890312483393993795771299613214079244000970819090031306604544 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade069Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade069Part03840 = 60471145300687011944178785334226013723122182615379629707470583102592747076458722359552618146968301708771328 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade069Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade069Part03904 = 138261819646512284373635024290213755560108539412596760400090868446778454590681046847537819882007843324297216 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade069Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade069Part03968 = 135455613450992292833728375657918442305994200897871546927109324992879579462517375581377156994812607236931584 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade069Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade069Part04032 = 98917248743523169821320950709915055563515861526537979637569522195238718975434079801052439594782274831253504 := by decide +kernel

theorem group_length : firstCenterIntegerGrade069Group007.size = 512 := by
  simp only [firstCenterIntegerGrade069Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade069Group007 = 1669816188780285153895779819456083377975483439301490408548817557448738712813783704554472806640232514126348288 := by
  simp only [firstCenterIntegerGrade069Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade069Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade069Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade069Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
