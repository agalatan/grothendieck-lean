import Grothe.UpperChaos.TaylorFirstIntegerGrade057Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade057Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade057Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade057Part03072 = 631651951756829422643907122278564006180096871524172670712606242487774752285862868058612103164835969332412416 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade057Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade057Part03136 = 571688376879613458247757484862102079928786081465642083238446031750302736707779908109733832911550039273242624 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade057Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade057Part03200 = 417435922683543331184019467849934623850057928294295482230772698943613597994642278755613252112618899596378112 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade057Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade057Part03264 = 292860995920460204697772713023630502251453571788379442444402063927429680730612982032608178004477528378441728 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade057Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade057Part03328 = 281687144082603443991449532891616257682718470094228083981376844145853537225787376437143714780884507274772480 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade057Part03392.size = 30 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade057Part03392 = 376807107952733253767338149868117565079531736007753731385003082603388680745298103949334345974183843344678912 := by decide +kernel

theorem group_length : firstCenterIntegerGrade057Group006.size = 350 := by
  simp only [firstCenterIntegerGrade057Group006, Array.size_append, len0, len1, len2, len3, len4, len5]

theorem group_energy : energy firstCenterIntegerGrade057Group006 = 2572131499275783114532244470773965034972644659174471493992606963858362985689983517343045426948550787199926272 := by
  simp only [firstCenterIntegerGrade057Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade057Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade057Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade057Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
