import Grothe.UpperChaos.TaylorFirstIntegerGrade026Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade026Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade026Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade026Part00000 = 2705139944693838245073621672537773496810793151904808742335020439398617187384701697064216103915939974262086891995136 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade026Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade026Part00064 = 477695521598810758327447389932245606144151381434737458313695926695543323475591659783064187613252715931477794095104 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade026Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade026Part00128 = 990955937965313834915087737854129681705342383084831325536056325425719828872558182773354148040067059378194588106752 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade026Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade026Part00192 = 174987009241142576606048344917376976598167429755752637884064822014619890154767101528578075202655422521483968118784 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade026Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade026Part00256 = 30162696293725210724016306104714023364971443975168633662133557487102527980435880038020617921888992020230458834944 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade026Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade026Part00320 = 12395398962401211028264377855264375974869689791685309230640209176578420123620203870692060092099379256546801221632 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade026Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade026Part00384 = 8420170343025909671417601853774263613661731400073731652396646526550386902594418427915040647637461608944696819712 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade026Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade026Part00448 = 2607568728340579636257620898594802027229759497811279317464609419019213147372548556388807407213604428615692320768 := by decide +kernel

theorem group_length : firstCenterIntegerGrade026Group000.size = 512 := by
  simp only [firstCenterIntegerGrade026Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade026Group000 = 4402364247826598325982161051953873226239186970844869117931472536143750778041641692042229040840754609407580891512832 := by
  simp only [firstCenterIntegerGrade026Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade026Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade026Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade026Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
