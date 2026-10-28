import Grothe.UpperChaos.TaylorFirstIntegerGrade060Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade060Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade060Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade060Part02048 = 122962406378430778092267788074044258747686076456677602731459852481546890987202536893433688748809338277152686080 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade060Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade060Part02112 = 69567354734886897393695274854640585056415388271664530483937623686116908748258987908468566465552481266077532160 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade060Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade060Part02176 = 48569665992194659471129638053703348197373759325882693882043650149444595320015686451300740408571712111070150656 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade060Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade060Part02240 = 34104495790452367558329841679595350423657133718079210909928055793556738875101539353946282166046251620713365504 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade060Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade060Part02304 = 23747464175654634468241483771610187121056891918285531700570838427001357683798044979030550735079724158008950784 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade060Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade060Part02368 = 16727615460569100406490871244300273802380011014268963934130798633791542532116612359095662875189564480805666816 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade060Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade060Part02432 = 12265093019902545893084432917686435481183057689048027500993091077228108628918605123520819131079965704147959808 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade060Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade060Part02496 = 9436334734588490934225565357679964135801454240703857519912790605917394920333529307508028490028488721231249408 := by decide +kernel

theorem group_length : firstCenterIntegerGrade060Group004.size = 512 := by
  simp only [firstCenterIntegerGrade060Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade060Group004 = 337380430286679474217464895953260402965553772634610418662976700854603537695745542376304339020357526339207561216 := by
  simp only [firstCenterIntegerGrade060Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade060Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade060Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade060Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
