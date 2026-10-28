import Grothe.UpperChaos.TaylorSecondIntegerGrade035Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade035Group002Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade035Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade035Part01024 = 5111612187858575204076127635247670457762496549057088114871340275633078440413122317758613116655526081881702400 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade035Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade035Part01088 = 4451664222412069493509725880175463288715965532455114691679165511538277827701887706932753867092824347440578560 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade035Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade035Part01152 = 3228664408855612924149289118185048659098821615495293786616805852922876718722735575166845859637496327450918912 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade035Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade035Part01216 = 1190011172536036784714766712815529910913334893217854921571413651400260177973591214896103639051614904419090432 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade035Part01280.size = 52 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade035Part01280 = 2755171202210896669531448383002095855356184046856942850963450321390378696079650794614355041507274680036229120 := by decide +kernel

theorem group_length : secondCenterIntegerGrade035Group002.size = 308 := by
  simp only [secondCenterIntegerGrade035Group002, Array.size_append, len0, len1, len2, len3, len4]

theorem group_energy : energy secondCenterIntegerGrade035Group002 = 16737123193873191075981357729425808171846802637082294365702175612884871860890987609368671523944736341228519424 := by
  simp only [secondCenterIntegerGrade035Group002, energy_append, sum0, sum1, sum2, sum3, sum4]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade035Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade035Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade035Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
