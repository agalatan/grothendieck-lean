import Grothe.UpperChaos.TaylorFirstIntegerGrade061Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade061Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade061Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade061Part02048 = 115541894565391601545502741963290796078487037737396661321860521720777371398392647304087505088244070816625459200 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade061Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade061Part02112 = 87806661533751198743506671374113930485832454820356010334981448719639982947412944097290613146822873832914681856 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade061Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade061Part02176 = 65220410093060887709405062487264159182584323269971304525912803685141230401027027600969135712194136323404070912 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade061Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade061Part02240 = 47218448972907629455699436108682871212847149033993703876332020276949303477738718471412913446258963240420638720 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade061Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade061Part02304 = 33417390941883039119137877550387257373989201313342043716089224010175980190413948949912108467108864841549348864 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade061Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade061Part02368 = 23272461179027313349546819447097417500830921691792852128472725451394975391098218665431171631604845175346561024 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade061Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade061Part02432 = 16111716531522562624548743651999293371026542913729538543424926075254909931501040023832555767266920894813962240 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade061Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade061Part02496 = 11336830615387174566349036954791778004059170860888935885925170005900616630306239827738379133744380264446951424 := by decide +kernel

theorem group_length : firstCenterIntegerGrade061Group004.size = 512 := by
  simp only [firstCenterIntegerGrade061Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade061Group004 = 399925814432931407113696389537627503209656801641471050332998839945234370367890784940674382393245055389521674240 := by
  simp only [firstCenterIntegerGrade061Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade061Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade061Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade061Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
