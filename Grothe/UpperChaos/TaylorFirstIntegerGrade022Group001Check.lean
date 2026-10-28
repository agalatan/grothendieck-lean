import Grothe.UpperChaos.TaylorFirstIntegerGrade022Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade022Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade022Part00512.size = 40 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade022Part00512 = 632996397973096928107980584683272544462956264118763792607544264067916504823814713037414104457343641534190321664 := by decide +kernel

theorem group_length : firstCenterIntegerGrade022Group001.size = 40 := by
  simp only [firstCenterIntegerGrade022Group001, len0]

theorem group_energy : energy firstCenterIntegerGrade022Group001 = 632996397973096928107980584683272544462956264118763792607544264067916504823814713037414104457343641534190321664 := by
  simp only [firstCenterIntegerGrade022Group001, sum0]

end Grothe.UpperChaos.TaylorFirstIntegerGrade022Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade022Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade022Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
