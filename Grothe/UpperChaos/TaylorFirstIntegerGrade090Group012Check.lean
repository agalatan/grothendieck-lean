import Grothe.UpperChaos.TaylorFirstIntegerGrade090Group012Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade090Group012Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade090Part06144.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade090Part06144 = 11801513589690868907368094299850127150909549352166547299941362232868786906360211582104770403068742859751424 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade090Part06208.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade090Part06208 = 10554113238394353235236710865684630190203619907781085449394064676874779807196646353460025072955882936991744 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade090Part06272.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade090Part06272 = 1129764924162378012683137695681412943108000139400574215986942453206906942443362607818045592489229492944896 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade090Part06336.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade090Part06336 = 9228949331165060972363641762559844845832432798842874677657730645547288959077395024861588201185551551823872 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade090Part06400.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade090Part06400 = 9957117005159940063704171841600727381378440006661404257359840445288378501245727300022411939860067077062656 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade090Part06464.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade090Part06464 = 5685506811024506813658920549115916996957838013788767462822428877853837584008489726147671239040758563471360 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade090Part06528.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade090Part06528 = 4698505272270256895071049273290898083995453400481361755252689448023187590121482217404436141184667669757952 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade090Part06592.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade090Part06592 = 10181303675067218966904126950032032505844251158807353785207337689912419859601056314539119888336576908886016 := by decide +kernel

theorem group_length : firstCenterIntegerGrade090Group012.size = 512 := by
  simp only [firstCenterIntegerGrade090Group012, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade090Group012 = 63236773846934583866989853237815590098229584777929968903622396469575586150054371126358068478121477060689920 := by
  simp only [firstCenterIntegerGrade090Group012, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade090Group012Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group012Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group012Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
