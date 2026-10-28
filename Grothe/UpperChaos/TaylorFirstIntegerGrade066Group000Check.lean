import Grothe.UpperChaos.TaylorFirstIntegerGrade066Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade066Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade066Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade066Part00000 = 19242735243717716186039859378920862660301521575725901079359224199796536169441858176739158610909739393528151146496 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade066Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade066Part00064 = 28138561710075376634179191215127874332977328792083220564091011282372404752687499676242421202379016099639538483200 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade066Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade066Part00128 = 38452531107388892436831703428611814359439082052221727832834133562335124184079434235012971928086531591080608006144 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade066Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade066Part00192 = 42362609787585288816784695349164196940913085870979711585485157297465787674212688603322709454006064911051101569024 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade066Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade066Part00256 = 42155424912703332664673713697627012076490550537801697000736671629817736525216015757878281093664312338428282798080 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade066Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade066Part00320 = 38599768346446333991532031675522271658956899542169471440214708336785349243724677116036838194730365777820231139328 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade066Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade066Part00384 = 32750815713922925745005154924140264226391180475959238411548383150458548272829517180661421160325246254859975393280 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade066Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade066Part00448 = 25741286080284906963481884635346939360059512277039892808943498317824787879788066274652943251166589694477464502272 := by decide +kernel

theorem group_length : firstCenterIntegerGrade066Group000.size = 512 := by
  simp only [firstCenterIntegerGrade066Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade066Group000 = 267443732902124773438528234304461235615529161123980860723212787776856274701979757020546744895267866060885353037824 := by
  simp only [firstCenterIntegerGrade066Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade066Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade066Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade066Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
