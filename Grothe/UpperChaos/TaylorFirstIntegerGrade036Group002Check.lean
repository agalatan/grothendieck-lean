import Grothe.UpperChaos.TaylorFirstIntegerGrade036Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade036Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade036Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade036Part01024 = 348453208409228718245526704492790882729033052938445671963433552875616319995275145316404923951883547644635643904 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade036Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade036Part01088 = 268300267850883675759896804910129565035706606294630584190960068536194311905263778261497670313255153566375477248 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade036Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade036Part01152 = 128104384072860883418847192585067183913644251638936299074358587199043046903605533313070163249842748220027961344 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade036Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade036Part01216 = 61463169793613255605913177885976764897911462907987449803419338255229915541439111341020553659721860585866919936 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade036Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade036Part01280 = 67322538988929995770838069008249073874884860991632589105319147458113031603974588753911880656092086746451279872 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade036Part01344.size = 62 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade036Part01344 = 97642427301199439556852422159918298488839206617335103280276533458684162302298888729570857297602294402468806656 := by decide +kernel

theorem group_length : firstCenterIntegerGrade036Group002.size = 382 := by
  simp only [firstCenterIntegerGrade036Group002, Array.size_append, len0, len1, len2, len3, len4, len5]

theorem group_energy : energy firstCenterIntegerGrade036Group002 = 971285996416715968357874371042131768940019441388967697417767227782880788251857045715476049128397691165826088960 := by
  simp only [firstCenterIntegerGrade036Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade036Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade036Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade036Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
