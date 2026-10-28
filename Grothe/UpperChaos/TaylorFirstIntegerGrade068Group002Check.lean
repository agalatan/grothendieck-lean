import Grothe.UpperChaos.TaylorFirstIntegerGrade068Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade068Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade068Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade068Part01024 = 2339017687335429527905927088252120992316925411412296509292237664270022898817340031695526924082773755969660780544 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade068Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade068Part01088 = 2277610701662913460683738186231571356750151101810193358822492268474180640822578197307052286438268998864309583872 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade068Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade068Part01152 = 2155935655232383694707594395865952438346436020383424253348707878106828015597402413678440823905310787536389406720 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade068Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade068Part01216 = 1967276185159625209185650344763891481556233488627689179424914844482314998889448141643746537458439241698597928960 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade068Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade068Part01280 = 1733567374454140696295441545319064420405125488193983200146604669926393313396421963489272100656807268743410352128 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade068Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade068Part01344 = 1481570398049492565698169630601125943228300084502345189673016690033750076898412127161059749325833158785864040448 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade068Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade068Part01408 = 892382357973922729890133945752929672080849787079270053625346258198636950180645134590934511730835416999482359808 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade068Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade068Part01472 = 374680184201892771863404173468929938741632320906709713265099669968561671798453655418141848017126936281826197504 := by decide +kernel

theorem group_length : firstCenterIntegerGrade068Group002.size = 512 := by
  simp only [firstCenterIntegerGrade068Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade068Group002 = 13222040544069800656230059310255586243425653702915911457598419943460688566400701664984174781615395564879540649984 := by
  simp only [firstCenterIntegerGrade068Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade068Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade068Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade068Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
