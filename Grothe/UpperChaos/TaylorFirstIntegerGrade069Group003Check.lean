import Grothe.UpperChaos.TaylorFirstIntegerGrade069Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade069Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade069Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade069Part01536 = 893435922495070823243050125150857989544044165635802175676798229981683673669482021477048333031804468086697885696 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade069Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade069Part01600 = 725554683919002138355030582391575470649288995337261014043016840596283575008715972347638292561109906621976281088 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade069Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade069Part01664 = 583984476130277900106772491618781409187544948876827074929326763604869126780064638366461383027597576852345978880 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade069Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade069Part01728 = 467255907690646183311444355562650974847455000267600555341367831921345201632513328017711377236219617325604667392 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade069Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade069Part01792 = 372142764175730072555579012359651901148344829300008490641648978098209093893289521490571709158547128173098696704 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade069Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade069Part01856 = 280596585386756521898094296174081267893764736072701953401750403309683275842838369783612622646099969813214396416 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade069Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade069Part01920 = 16346817761920494985072609429656446574191764274157835622996760910662995313107692174782738209854992534225289216 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade069Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade069Part01984 = 231508416501258519330294563723279677938277024004721402803081711796882920592094144480581268691660175354535870464 := by decide +kernel

theorem group_length : firstCenterIntegerGrade069Group003.size = 512 := by
  simp only [firstCenterIntegerGrade069Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade069Group003 = 3570825574060662653785338036410535137782911463769080502459987520219619862732105688138407724562893834761699065856 := by
  simp only [firstCenterIntegerGrade069Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade069Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade069Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade069Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
