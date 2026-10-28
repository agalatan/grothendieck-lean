import Grothe.UpperChaos.TaylorFirstIntegerGrade069Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade069Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade069Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade069Part02048 = 183877845328974576000726815502328873899967230170747003616001950983049355123050725308272379232190610177332871168 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade069Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade069Part02112 = 144958768222295548222030804973872448691881807155267935544569272250407229651709212445408494180112852103225933824 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade069Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade069Part02176 = 114386515786828210637582966040973334577744709086893201711005983441564223719832316100144200322580538726430015488 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade069Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade069Part02240 = 90296080782278346966040764801454411457901179228399474751707344481367188477300881080353245051962309575421460480 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade069Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade069Part02304 = 71072204254698747504125149390749863655423606732642144966837816979331569848210580767978864866635242547563200512 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade069Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade069Part02368 = 55449652909788881591608876759247665616393757193432006489610517156659916983797720059235413292309430380473090048 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade069Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade069Part02432 = 42570500172907856917379532200819738377458137670444458118042083168127252989219046423119166319921580158033592320 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade069Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade069Part02496 = 31487714803638322485140311784974222191445635039293196631974639939489932115235474611866470453583644416762970112 := by decide +kernel

theorem group_length : firstCenterIntegerGrade069Group004.size = 512 := by
  simp only [firstCenterIntegerGrade069Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade069Group004 = 734099282261410490324635221454420558468216062277119421829749608399996668908355956796378233719296208085243133952 := by
  simp only [firstCenterIntegerGrade069Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade069Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade069Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade069Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
