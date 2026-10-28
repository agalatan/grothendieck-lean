import Grothe.UpperChaos.TaylorFirstIntegerGrade056Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade056Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade056Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade056Part03072 = 1162200055170844723748521998201217546417131551650699402529458579104685312619817531006300321758081583278981120 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade056Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade056Part03136 = 399244322308643705420445493814358397154036182347470349832366250562459555935757283836120079169852640029835264 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade056Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade056Part03200 = 414044938106822074446172570376735426066384795175836557992046864636294718404917167939055979878725689559482368 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade056Part03264.size = 42 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade056Part03264 = 568224358808024586449194451833457184756483932298648391071070874621312846771703716122228701062683127879565312 := by decide +kernel

theorem group_length : firstCenterIntegerGrade056Group006.size = 234 := by
  simp only [firstCenterIntegerGrade056Group006, Array.size_append, len0, len1, len2, len3]

theorem group_energy : energy firstCenterIntegerGrade056Group006 = 2543713674394335090064334514225768554394036461472654701424942568924752433732195698903705081869343040747864064 := by
  simp only [firstCenterIntegerGrade056Group006, energy_append, sum0, sum1, sum2, sum3]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade056Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade056Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade056Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
