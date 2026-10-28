import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade071Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade071Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade071Part00000 = 10527745862322359381096309274769996048572880790882753443443713666947192562190505122768826866046098687417112330240 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade071Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade071Part00064 = 12623406421088086015293519030680507923942367983061104446992304585019148689885650720763296590179214746755266510848 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade071Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade071Part00128 = 15018792153654658190729242837572834873760493600940344083477627001918527014959416898807937769926470235974633783296 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade071Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade071Part00192 = 16468159179012506750683747138554397444468998216592910166155063007839597913558594397009790805250318283384335368192 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade071Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade071Part00256 = 16755620853596103152646821244188600993196980376133951542663051731466801203475219992820599908743446406336729841664 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade071Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade071Part00320 = 15713946925171908065827455311222400370377400371894191895541477007348632068377316824711690887884444095500947292160 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade071Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade071Part00384 = 13697574795132958391889711993286555858033814942551923892216950378505089580271534488442424108150209456075092000768 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade071Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade071Part00448 = 6541989763323286680928899165466633882659877692058490531771985543147894498386797753779628840327381697340735750144 := by decide +kernel

theorem group_length : firstCenterIntegerGrade071Group000.size = 512 := by
  simp only [firstCenterIntegerGrade071Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade071Group000 = 107347235953301866629095705995741927395012813974115670002262172922192883531105036199104195776507583608784852877312 := by
  simp only [firstCenterIntegerGrade071Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade071Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
