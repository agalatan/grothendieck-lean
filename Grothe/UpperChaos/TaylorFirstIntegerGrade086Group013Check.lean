import Grothe.UpperChaos.TaylorFirstIntegerGrade086Group013Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade086Group013Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade086Part06656.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade086Part06656 = 14392848099654279175161070254868657678949048795322816131011050163203771438322088337415623236367334162563072 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade086Part06720.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade086Part06720 = 15488152861893552190201030556481236863532309468830570187482262049617104416222457511240738364698268979429376 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade086Part06784.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade086Part06784 = 657696660232674403517745741274714061321976051270725489099681153207474379805594006241667377674783578652672 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade086Part06848.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade086Part06848 = 11078737640011232310652690281468906203950116995531246326988431765141308465710041354584034663007498469900288 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade086Part06912.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade086Part06912 = 10658982841781771354191221555229516920814968020720229265387244250845200949024396077163412248424935170506752 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade086Part06976.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade086Part06976 = 8091163645440558509967647195771913679286991028978789841617071704405796248081440166381876202556359176093696 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade086Part07040.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade086Part07040 = 1200402598852324862408919813880945833316200724434614414219362102605944012265285630263302587510552434573312 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade086Part07104.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade086Part07104 = 10541553215073366117755691211252954692544238026906304817533349425402907629929151082995486156044344955502592 := by decide +kernel

theorem group_length : firstCenterIntegerGrade086Group013.size = 512 := by
  simp only [firstCenterIntegerGrade086Group013, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade086Group013 = 72109537562939758923856016610228845933715849111995296473338452614429507539360454166286140836284076927221760 := by
  simp only [firstCenterIntegerGrade086Group013, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade086Group013Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group013Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group013Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
