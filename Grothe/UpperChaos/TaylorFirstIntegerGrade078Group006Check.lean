import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade078Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade078Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade078Part03072 = 8778881660756360910629531596701393255132126687221111099017655470589190567290324647444994981512161271786504192 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade078Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade078Part03136 = 1333601117587564642712824580351311118175526170221318670198689290106752343407998729659356733681847561080537088 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade078Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade078Part03200 = 5157049521723951282906362814030020893791556518488866952733946494150772920349744287979243942961217430102212608 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade078Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade078Part03264 = 4730648791485593486280722822099306889666601489363205169678736332123657471069550628353196517031932793538478080 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade078Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade078Part03328 = 3400219545466783719992894973999889693859693717968113861845232298716647333456234469138860097824864933410504704 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade078Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade078Part03392 = 2412690331499366794091899210647928104726343085018465172723151968614464289977174797037851821027080615202127872 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade078Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade078Part03456 = 496353806959213855218263401552133777787094741995159436057875033163627729807807664254984933226775278176436224 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade078Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade078Part03520 = 1201695695264015037582336456037343554855785429562856070497450391797986255711697758425781694896845223140261888 := by decide +kernel

theorem group_length : firstCenterIntegerGrade078Group006.size = 512 := by
  simp only [firstCenterIntegerGrade078Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade078Group006 = 27511140470742849729414835855419327287994727839839096432752737279263098911070532982294270722162725106437062656 := by
  simp only [firstCenterIntegerGrade078Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade078Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
