import Grothe.UpperChaos.TaylorFirstIntegerGrade035Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade035Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade035Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade035Part00000 = 522324762035772751565932148239009595675690582950813022653982114371354171203443590357894438487099082847036612018176 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade035Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade035Part00064 = 663651113221731012500816107037815919411382868986973014774123717929215850031289140562819988115214890733830099959808 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade035Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade035Part00128 = 184966450198234756731476770563407221862657686611376435974530062803342025393850965019093567841163381554103214669824 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade035Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade035Part00192 = 272223087231219445522105679856164864308396930943536118524963581936553977961022715607626524214846156045250514124800 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade035Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade035Part00256 = 155420633247902414813553492505988892577074016902387802227603402008274580785621987252177155938271303439225584615424 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade035Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade035Part00320 = 165879850286016563691324578297858399392582403083356218140839333047998442817290741607313261155649633488032248102912 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade035Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade035Part00384 = 65005683023621233478151128652706745136002253215455269274826381110517305752188202580999471578609721709127081656320 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade035Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade035Part00448 = 17194781159896424638842397515740948108386361166146198016742438318167151125433443969719005117367373029962602774528 := by decide +kernel

theorem group_length : firstCenterIntegerGrade035Group000.size = 512 := by
  simp only [firstCenterIntegerGrade035Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade035Group000 = 2046666360404394602942202302668692586472173103860044079587611031525423505070140786957643412448221542846567957921792 := by
  simp only [firstCenterIntegerGrade035Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade035Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade035Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade035Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
