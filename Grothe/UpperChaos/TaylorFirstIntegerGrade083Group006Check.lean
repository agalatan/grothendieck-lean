import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade083Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade083Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade083Part03072 = 9754100561639010379945457527343594539570555695891314220377522976581877784937387363628131125661332611792896 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade083Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade083Part03136 = 12433360484635754965260605486170115546387467091004617561352238508413437810598671363094916292659836704666943488 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade083Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade083Part03200 = 9898015667472430437902925948885598344947165388042950326485775735678962658136519103305544697583424433024925696 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade083Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade083Part03264 = 7768767165320894375701473741974211228004868240662219080199538217971023571100815216518195483196498401636122624 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade083Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade083Part03328 = 7186984674644854368743624596184410887239218590051824369093457659723620676693629325527354581490066922668032 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade083Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade083Part03392 = 5983106253653733348591069997299902984410265770094167703785874441778485641724367176612028609716371804353724416 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade083Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade083Part03456 = 4516090425502265335263323858736341742446238712122814298001496059133260943916898854483387812188292570188611584 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade083Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade083Part03520 = 3328767407904204087478543524776288286917428687087048420980589130764499150345528437123799407712953218055012352 := by decide +kernel

theorem group_length : firstCenterIntegerGrade083Group006.size = 512 := by
  simp only [firstCenterIntegerGrade083Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade083Group006 = 43945048489725566414946631639965986138540243663299760529394983074375975274284431167827027788764528531459801088 := by
  simp only [firstCenterIntegerGrade083Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade083Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
