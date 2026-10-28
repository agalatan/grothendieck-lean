import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group010Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade079Group010Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade079Part05120.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade079Part05120 = 10894718060090220727241727900432720740359426342286156872525199772070201614003373412801475191406364081520640 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade079Part05184.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade079Part05184 = 9532736913386725581350141406263663527254133386838885262197619993874036011456990778157172413576134201966592 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade079Part05248.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade079Part05248 = 17733975124385575586261671703085977416145275021741715830571954278529499982768641490881572726996537555550208 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade079Part05312.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade079Part05312 = 20821472402944792119236657165352319546953804397377996780613644179923552342211131786082799383313622549659648 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade079Part05376.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade079Part05376 = 19409340553009498535962633493238141200322455023702706776305470738803544834661381620515766392465520817340416 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade079Part05440.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade079Part05440 = 9990211106253614907951360281000003176186507952757739046352968817181072399452201074322796163795139700981760 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade079Part05504.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade079Part05504 = 10189734688877040885868797117458506858166549466949121753660329201054690518410773616204462218880742116556800 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade079Part05568.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade079Part05568 = 20336560548607775958416939256565012241331080499710609408511594191568998604003790944161013712150945907867648 := by decide +kernel

theorem group_length : firstCenterIntegerGrade079Group010.size = 512 := by
  simp only [firstCenterIntegerGrade079Group010, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade079Group010 = 118908749397555244302289928323396344706719232091364931730738781173005596306968284723127058202585006931443712 := by
  simp only [firstCenterIntegerGrade079Group010, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade079Group010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group010Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group010Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
