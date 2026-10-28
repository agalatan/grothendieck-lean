import Grothe.UpperChaos.TaylorFirstIntegerGrade055Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade055Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade055Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade055Part03072 = 1073941852051572201354474286085274441277089487848523308138673422435228047592349940401455647227216272388259840 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade055Part03136.size = 56 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade055Part03136 = 836059735449829392629081458953258675292681449357627312603739328195833251746244024593332678540403184450404352 := by decide +kernel

theorem group_length : firstCenterIntegerGrade055Group006.size = 120 := by
  simp only [firstCenterIntegerGrade055Group006, Array.size_append, len0, len1]

theorem group_energy : energy firstCenterIntegerGrade055Group006 = 1910001587501401593983555745038533116569770937206150620742412750631061299338593964994788325767619456838664192 := by
  simp only [firstCenterIntegerGrade055Group006, energy_append, sum0, sum1]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade055Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade055Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade055Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
