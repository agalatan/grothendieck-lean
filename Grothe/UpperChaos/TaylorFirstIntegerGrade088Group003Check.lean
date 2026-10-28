import Grothe.UpperChaos.TaylorFirstIntegerGrade088Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade088Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade088Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade088Part01536 = 23781899266669343910905854515346577023320835154307852294661669905610228602360649654181888555934628864514326528 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade088Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade088Part01600 = 283053509210043676171069248819194160889963228278129754617175444153914257975679393644874532259842678877604282368 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade088Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade088Part01664 = 258702819096555038414920267561006232402827659786098873739523723910378945239458837056607610464517314626178777088 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade088Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade088Part01728 = 1409945479478214970730336377544158583511745221898640274246633580257165748559615569920947364149929849890275328 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade088Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade088Part01792 = 229620612410607888448540361391714826290430225372347113364655366601916424132514724500357289977569974553690505216 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade088Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade088Part01856 = 201399254334430228272457960034795576723227284825594935719991852755640453804095840790844279312277717857997946880 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade088Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade088Part01920 = 161770401746753447403181231876870409548102387695127936070733681363847728627104122058921662156283395003257978880 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade088Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade088Part01984 = 10574784263658401533558943395406222644627248862854798085236131193392159946456700838969876401788059240296873984 := by decide +kernel

theorem group_length : firstCenterIntegerGrade088Group003.size = 512 := by
  simp only [firstCenterIntegerGrade088Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade088Group003 = 1170313225808196239125364203971878164106010615196359904166224503464957364076229884114678086492363698873430966272 := by
  simp only [firstCenterIntegerGrade088Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade088Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
