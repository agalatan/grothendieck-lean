import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade079Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade079Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade079Part03584 = 961272010663828933859745209122262200095085486778923103343862903451369920793054140718524423284284189396959232 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade079Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade079Part03648 = 212822721620395935721493772925473302898477579950360387459601701344038813016278740817103725114963129471598592 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade079Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade079Part03712 = 814154633387607789054009417201428660938842021377148790783522014605628573456044989739433762338730305948483584 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade079Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade079Part03776 = 552085539022547196186865237559073457655783360409590133662753681019798055972167188120769292546666588788490240 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade079Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade079Part03840 = 352801284731402836119228438103231236924783907500193924642698196402473737693064598325046274746557415196459008 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade079Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade079Part03904 = 74059433067040550684304202686985518357534846615988225062078408389869392034235965276059188883637165092765696 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade079Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade079Part03968 = 138378929982083779906589837173375016631570931812392587578757538311650062057806563259122083808081093089820672 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade079Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade079Part04032 = 131753425052036973254072324206661287246143669229134928161188223046132161052592644061812650253001576310374400 := by decide +kernel

theorem group_length : firstCenterIntegerGrade079Group007.size = 512 := by
  simp only [firstCenterIntegerGrade079Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade079Group007 = 3237327977526943994786308438978490680748221803673732080694462666570960716075244830317871400975921463294951424 := by
  simp only [firstCenterIntegerGrade079Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade079Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
