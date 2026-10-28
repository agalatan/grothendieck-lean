import Grothe.UpperChaos.TaylorSecondIntegerGrade022Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade022Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade022Part00512.size = 40 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade022Part00512 = 61868250267614954674593245015172742003295229707460150289241932797074316199532855682679494417974650455535386624 := by decide +kernel

theorem group_length : secondCenterIntegerGrade022Group001.size = 40 := by
  simp only [secondCenterIntegerGrade022Group001, len0]

theorem group_energy : energy secondCenterIntegerGrade022Group001 = 61868250267614954674593245015172742003295229707460150289241932797074316199532855682679494417974650455535386624 := by
  simp only [secondCenterIntegerGrade022Group001, sum0]

end Grothe.UpperChaos.TaylorSecondIntegerGrade022Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade022Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade022Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
