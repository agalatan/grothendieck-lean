import Grothe.UpperChaos.TaylorFirstIntegerGrade020Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade020Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade020Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade020Part00000 = 6196753804825783827899896103566804676876976166864909615118476290653261830182523169359648917419303568618325828173824 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade020Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade020Part00064 = 2294139673075974815049199658718311293345638057854076222765558657162299624181612114573170742088789605154228830994432 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade020Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade020Part00128 = 342266341140193437615272536716261429175306210207585362289969046878739065542195995672154750821838258025210543341568 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade020Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade020Part00192 = 27063864449661916931358443047682474278029349253563110554517061364433690006288667207196484750944527162459518140416 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade020Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade020Part00256 = 6679792404905123756981114091292764466730540203381153301085031827286343204956117109925082677452578374210100920320 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade020Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade020Part00320 = 3280726248859301174326495689901093909225056679738589999849620050482799060710408004656544927489878367208359329792 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade020Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade020Part00384 = 2127067983567923111600680383180416773072195440248586044870280538240553298709188942801804194999269781103739666432 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade020Part00448.size = 14 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade020Part00448 = 388744442989470015161436699135777267443206374273298926299700433652310944210339922957242417818686960887161421824 := by decide +kernel

theorem group_length : firstCenterIntegerGrade020Group000.size = 462 := by
  simp only [firstCenterIntegerGrade020Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade020Group000 = 8872700014571935815553796468912569926092420782877775939000625688908396216421206000792511569298636372443634081988608 := by
  simp only [firstCenterIntegerGrade020Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade020Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade020Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade020Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
