import Grothe.UpperChaos.TaylorFirstIntegerGrade070Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade070Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade070Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade070Part03072 = 2594407277630723167723587966124872687321731241351324443064566230834523324080636445622846230407486286831026176 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade070Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade070Part03136 = 1762564788978157720348980257643990919974299724008475365669280963428746405512590179120512397154031129294012416 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade070Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade070Part03200 = 1197509415906807074587352593227954137046220983457459243042320197958635969860980552741205188391364642123808768 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade070Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade070Part03264 = 794633179982813945729914762193702459087157718985298126106226897559051621054182972118725833077151967532285952 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade070Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade070Part03328 = 514853505733880730116835044931903322947535155707076867610587649936502106951324518205986288041528562204803072 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade070Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade070Part03392 = 293328852222475030822069234343646277522415812578727386997299356005542453190629802690686928782857710545666048 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade070Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade070Part03456 = 97513154553710924678254977755086807643850975240754046548499782060880922155100284985015164512440862598234112 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade070Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade070Part03520 = 361876290375917873090094192111643169864909533316688512401932568765169229445223413297918351929574337636466688 := by decide +kernel

theorem group_length : firstCenterIntegerGrade070Group006.size = 512 := by
  simp only [firstCenterIntegerGrade070Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade070Group006 = 7616686465384486467097089028332799781408121144645803991440713646549052032250668168782896382296435498766303232 := by
  simp only [firstCenterIntegerGrade070Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade070Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade070Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade070Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
