import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade078Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade078Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade078Part01024 = 1084015385042150764118723333205242528988618257172760319491959780657822557062593119740055390262303611614247518208 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade078Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade078Part01088 = 863855042048142259759261554233242686874704073942445625857246303609801243229975416125837982797455209295268282368 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade078Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade078Part01152 = 757712425898794852497467855983953696768543651652255413144199369540685850512460899396303873770157054031105622016 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade078Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade078Part01216 = 158916382219556996519629152664659202137013923631486017384935484678356047168460875490753274897513623176678998016 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade078Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade078Part01280 = 544438169719072420446275836387988750076399051691353957870003919535103207747743703931028155796563558656154533888 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade078Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade078Part01344 = 658896875013415364787037333336576712149156263847103874305617915976971895713575134231794622686841793473853521920 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade078Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade078Part01408 = 607815791637749757498498485403470517579804167854082168536823546534553875853341807939040643853628306347081596928 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade078Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade078Part01472 = 545651096389735994571569007124852109018781138907712926603156519594437208218448209403997873749461660638352769024 := by decide +kernel

theorem group_length : firstCenterIntegerGrade078Group002.size = 512 := by
  simp only [firstCenterIntegerGrade078Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade078Group002 = 5221301167968618410198462558339986203593020528699200303193942840127731885506599166258811817813924817232742842368 := by
  simp only [firstCenterIntegerGrade078Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade078Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
