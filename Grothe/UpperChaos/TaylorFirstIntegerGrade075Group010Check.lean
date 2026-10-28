import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group010Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade075Group010Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade075Part05120.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade075Part05120 = 23253612244193804496304664426501698947016887199289598142912256063604149142709649214293718235620929733394432 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade075Part05184.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade075Part05184 = 17937172768602761909463250461180553734021937270921487716597083590526271531382719588683350842855245421215744 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade075Part05248.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade075Part05248 = 15201144149055603491682839927591659311241495431823981900545249837969387023150986412276847871139115538841600 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade075Part05312.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade075Part05312 = 3240263339086803506766648638995911931052962072217945738178843111593394515715517098121458574497683335020544 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade075Part05376.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade075Part05376 = 17473357639558015162435450533023499875104969342476072176341672959387874335518576588588915523587823997288448 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade075Part05440.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade075Part05440 = 15293225100104916467561835133829255869972072739667340437223675517871255734084452171918860055627248980459520 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade075Part05504.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade075Part05504 = 27712172314515544521737560248752483647098308291299570308820617299932249773049531759670928035565278775476224 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade075Part05568.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade075Part05568 = 30874529717435995111387823811768239544238518069221763534381815604993665243929135964570584829555167486541824 := by decide +kernel

theorem group_length : firstCenterIntegerGrade075Group010.size = 512 := by
  simp only [firstCenterIntegerGrade075Group010, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade075Group010 = 150985477272553444667340073181643302859747150416917759955001213985878247299540568798124663968448493268238336 := by
  simp only [firstCenterIntegerGrade075Group010, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade075Group010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group010Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group010Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
