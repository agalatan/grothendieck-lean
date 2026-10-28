import Grothe.UpperChaos.TaylorFirstIntegerGrade044Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade044Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade044Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade044Part01536 = 37474083400201839280509478095818051422005699038293608892822639334938637500067962263836207919008648605869277184 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade044Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade044Part01600 = 56957517813616526554145253752775222424101799711823524458156212559582363576008257254483064142500570408027160576 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade044Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade044Part01664 = 25138461900461787178269035627970160988620468456124103798534152808272215428865512803997563362558690183209811968 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade044Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade044Part01728 = 17815916351884383702731230236438135554861372418288474485798783558214407287113654087501289165871802547884261376 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade044Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade044Part01792 = 6644753047979091687154357786055308747670301348120902940247581973083644917078130449763902486506712543078121472 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade044Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade044Part01856 = 6876287177560300493700922026252443479921168965394192453055926452701201413386486948294687713160522198650191872 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade044Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade044Part01920 = 12629168327844577150453893668745074609636558895313626042362126619060716758130257137594598094338494810153811968 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade044Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade044Part01984 = 8655545102406962229809898533203721719251895105380906712076293581930498527528737950535208461066379870743822336 := by decide +kernel

theorem group_length : firstCenterIntegerGrade044Group003.size = 512 := by
  simp only [firstCenterIntegerGrade044Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade044Group003 = 172191733121955468276774069727258118946069263938739339783053716887783685408178998896006521345011821167616458752 := by
  simp only [firstCenterIntegerGrade044Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade044Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade044Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade044Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
