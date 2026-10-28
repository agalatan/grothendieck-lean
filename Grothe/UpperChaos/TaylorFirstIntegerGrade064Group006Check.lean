import Grothe.UpperChaos.TaylorFirstIntegerGrade064Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade064Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade064Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade064Part03072 = 1390271121650113178282296527485129510513997312150636891532650895763195496325231630107335016030593980758491136 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade064Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade064Part03136 = 1231896138638201653606458246743882745123311231404935453913269108621918949812838356857870473235464353765916672 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade064Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade064Part03200 = 1160513499423143240278060431586645076399705123674635337495717629727235079675192992891598880944430641733173248 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade064Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade064Part03264 = 1005178201871813898137784715443798018357079857239630343282503796977672716579809916419013284241757486152941568 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade064Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade064Part03328 = 789588044828651104507102529921478064684048560901072143707816059546878079300992461406710404407372121617989632 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade064Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade064Part03392 = 596038372502159363078825114551579712568090530856627561884715011138938110975976881847813548566283868446916608 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade064Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade064Part03456 = 433004015782090042421621191028205806975311533360204390644057017791388223929565441299236224605016943392456704 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade064Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade064Part03520 = 292525770991313593212700165321969698778323819744979775730670282199898268211643359631305835504136839577468928 := by decide +kernel

theorem group_length : firstCenterIntegerGrade064Group006.size = 512 := by
  simp only [firstCenterIntegerGrade064Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade064Group006 = 6899015165687486073524848922082688633399867969332721898191399801767124924811251040460883667535056235445354496 := by
  simp only [firstCenterIntegerGrade064Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade064Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade064Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade064Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
