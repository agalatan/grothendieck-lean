import Grothe.UpperChaos.TaylorFirstIntegerGrade032Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade032Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade032Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade032Part01024 = 140540796805820150954026934640347870081478621733731427434774616743186595409183122489038160208501844488621129728 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade032Part01088.size = 34 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade032Part01088 = 71847814609503048564463886502042487993356388453687999941086627007942707855803651263225440911385974954499506176 := by decide +kernel

theorem group_length : firstCenterIntegerGrade032Group002.size = 98 := by
  simp only [firstCenterIntegerGrade032Group002, Array.size_append, len0, len1]

theorem group_energy : energy firstCenterIntegerGrade032Group002 = 212388611415323199518490821142390358074835010187419427375861243751129303264986773752263601119887819443120635904 := by
  simp only [firstCenterIntegerGrade032Group002, energy_append, sum0, sum1]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade032Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade032Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade032Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
