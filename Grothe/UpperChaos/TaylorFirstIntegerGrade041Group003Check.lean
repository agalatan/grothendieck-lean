import Grothe.UpperChaos.TaylorFirstIntegerGrade041Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade041Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade041Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade041Part01536 = 24712601160350437060227562908798448384039750997433828869225209836352395041007321487642655307214387648980320256 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade041Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade041Part01600 = 7891690084286031896566303980243249425742800819907981281041661723767726040860721823300444128453118506087481344 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade041Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade041Part01664 = 21962086658454638147802983226029228980037550466160313803779975326086050648789383634335575819754926042765066240 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade041Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade041Part01728 = 12231017850939081413324171712336390758482336020503930197584283544510240239184001938304277549236935120620879872 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade041Part01792.size = 14 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade041Part01792 = 26508176385838546375259679224082020901267181630369522470813474194234845322049789901368633595568812245567668224 := by decide +kernel

theorem group_length : firstCenterIntegerGrade041Group003.size = 270 := by
  simp only [firstCenterIntegerGrade041Group003, Array.size_append, len0, len1, len2, len3, len4]

theorem group_energy : energy firstCenterIntegerGrade041Group003 = 93305572139868734893180701051489338449569619934375576622444604624951257291891218784951586400228179564021415936 := by
  simp only [firstCenterIntegerGrade041Group003, energy_append, sum0, sum1, sum2, sum3, sum4]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade041Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade041Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade041Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
