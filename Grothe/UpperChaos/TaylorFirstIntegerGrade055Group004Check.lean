import Grothe.UpperChaos.TaylorFirstIntegerGrade055Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade055Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade055Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade055Part02048 = 78149070549158174955863709428183437277634627551578410039619062835746931329357782536271807344426794343026655232 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade055Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade055Part02112 = 43601985015296698608409079284704375007012723882451618506747984769692457347672131217179152986454712354263269376 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade055Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade055Part02176 = 27151101143787688278077482123002406745240536127117068370465013327846954315953552770493631277810591923456442368 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade055Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade055Part02240 = 21450808522379803598161063201898918671818055008396835933154337360625484015936938309852700542893715385730727936 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade055Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade055Part02304 = 15364629681004979453100949237548672887464908744636953883165677844329418007915518523465692108926635537757896704 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade055Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade055Part02368 = 9567026686466065241489681964308954028539106429196405751731781492072591569460232379225327287017785150326964224 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade055Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade055Part02432 = 5923796871282288845744912700041290525697612430571905744223222288413863236728944368318551945252591602688327680 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade055Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade055Part02496 = 4591767911287848259721455670282723901363457105781274172761132590902674955628398144491905596665612249549766656 := by decide +kernel

theorem group_length : firstCenterIntegerGrade055Group004.size = 512 := by
  simp only [firstCenterIntegerGrade055Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade055Group004 = 205800186380663547240568333609970779044771027279730472401868212509630374778653498249298769089448438546800050176 := by
  simp only [firstCenterIntegerGrade055Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade055Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade055Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade055Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
