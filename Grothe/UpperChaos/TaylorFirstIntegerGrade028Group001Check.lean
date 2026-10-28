import Grothe.UpperChaos.TaylorFirstIntegerGrade028Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade028Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade028Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade028Part00512 = 2407421354704120137346510382234001527168079225089783566515724833804186941809020520486653369590832355935495651328 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade028Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade028Part00576 = 1938451648589028166409068434381501456797431238230837141880147144056680402325869213801986361270634822302347296768 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade028Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade028Part00640 = 1156492176004733309220856677602407097413758504678455131835264880835336124183317263790661709189727922178960130048 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade028Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade028Part00704 = 724023457821019659236319578687056984462535863405655820356833491811892422123264350872432055544205283219071827968 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade028Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade028Part00768 = 544902577783529204919805273065594451724560879944687198478201694210187645628474730894216769155489967014582157312 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade028Part00832.size = 38 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade028Part00832 = 139021706120449203525243866964146135983032859798313037751483544375845421991207391508078688962861193090163539968 := by decide +kernel

theorem group_length : firstCenterIntegerGrade028Group001.size = 358 := by
  simp only [firstCenterIntegerGrade028Group001, Array.size_append, len0, len1, len2, len3, len4, len5]

theorem group_energy : energy firstCenterIntegerGrade028Group001 = 6910312921022879680657804212934707653549398571147731896817655589094128958061153471354028953713751543740620603392 := by
  simp only [firstCenterIntegerGrade028Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade028Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade028Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade028Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
