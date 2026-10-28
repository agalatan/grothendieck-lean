import Grothe.UpperChaos.TaylorFirstIntegerGrade049Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade049Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade049Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade049Part00000 = 235994996662395904684571048316437672065863402482781898287361816016662660290928107798634128541912227434854828998656 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade049Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade049Part00064 = 163432070848817983297161955918808321600253524001514070368509772071422499395869778411809656477432366565594232782848 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade049Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade049Part00128 = 110048936049355908791048739475879132377334735383644197182876134402114770897417176307812646519103058602193428938752 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade049Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade049Part00192 = 230095385859776530556831240723977156736511821867845224267527127158727479868032864517759875000886685714405025382400 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade049Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade049Part00256 = 227707496965527266223158869023890235709144237411225243373627201535796531105304185717520376822739758918659561488384 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade049Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade049Part00320 = 213683561380689620317722083163062396956740799675140306215986188981303250889753536692512577270784721652369510629376 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade049Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade049Part00384 = 183397858939802535589722063855312825357708454813029646891781887209363757543624995146760925811937528837820204974080 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade049Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade049Part00448 = 226151984260231847816290245998282853795810498417190035241039019124627036856260950650348702479895758911653957074944 := by decide +kernel

theorem group_length : firstCenterIntegerGrade049Group000.size = 512 := by
  simp only [firstCenterIntegerGrade049Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade049Group000 = 1590512290966597597276506246475650594599367474052370621828709146500017986847191595243158888924692106637550750269440 := by
  simp only [firstCenterIntegerGrade049Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade049Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade049Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade049Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
