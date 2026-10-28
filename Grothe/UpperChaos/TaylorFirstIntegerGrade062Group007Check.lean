import Grothe.UpperChaos.TaylorFirstIntegerGrade062Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade062Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade062Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade062Part03584 = 159153845150496605763780827818347078410910105443428030541719423496314868939822211677799164486545583802155008 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade062Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade062Part03648 = 77706597128761613723985725587181692930016224045609775915008357435634076408565129810584028055563503390425088 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade062Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade062Part03712 = 124030903699325034513916447017791437697735981925804021248275600673140257672351229378293317003099767723524096 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade062Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade062Part03776 = 105623092424257459495427370599876601597740426602381185536587642838976087177209469724486805817257326612054016 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade062Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade062Part03840 = 73148110425657609570340286327384669519533568814673040773483842902958906870217554629346582026587615635963904 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade062Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade062Part03904 = 49524766064172132457627435990294725261296325195396765315257499431883028236160528593639889845124531237158912 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade062Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade062Part03968 = 45538248737783145447366328120287886846813394487574157063586995746278288456201313389457979969339840102662144 := by decide +kernel

theorem group_length : firstCenterIntegerGrade062Group007.size = 448 := by
  simp only [firstCenterIntegerGrade062Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6]

theorem group_energy : energy firstCenterIntegerGrade062Group007 = 634725563630453600972444421461164092264046026514866976393919362525185513760527437203607767203518168503943168 := by
  simp only [firstCenterIntegerGrade062Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade062Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade062Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade062Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
