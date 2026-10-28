import Grothe.UpperChaos.TaylorFirstIntegerGrade084Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade084Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade084Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade084Part01536 = 364263997344109052842924961238378678921814204023498616471002016956449412221330355465535080788830048143691218944 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade084Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade084Part01600 = 335408630990678534665217321053519577916192021046229047891901330772094222052103819321979589559388840800760627200 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade084Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade084Part01664 = 295051783238329168367520722898762886890926819852876966843344995088725855648966865714438951714289626972155805696 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade084Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade084Part01728 = 1579605565964799954856184009664728063986404658455487945692297238553483960195984485989595814694328324933550080 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade084Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade084Part01792 = 256985172768595936428954157691152111730461738040887218152659268098496059066682368958312819012160826684725002240 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade084Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade084Part01856 = 219987677857473366528466045908314137644574175893968919976305575768211361050202816534205138790683636101644550144 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade084Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade084Part01920 = 184819836187467603742623782065013309034011112443640615466180392818993413061360817201879161203334704967595327488 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade084Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade084Part01984 = 1192982206801931500288310091613332304985355570776399810259405277518292954590791598736479940230935019566137344 := by decide +kernel

theorem group_length : firstCenterIntegerGrade084Group003.size = 512 := by
  simp only [firstCenterIntegerGrade084Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade084Group003 = 1659289686159420394030851484956418762506951831530333272557345282019042100015433819281076816823612947015072219136 := by
  simp only [firstCenterIntegerGrade084Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade084Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
