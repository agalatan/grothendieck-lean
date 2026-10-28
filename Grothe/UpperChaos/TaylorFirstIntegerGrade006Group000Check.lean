import Grothe.UpperChaos.TaylorFirstIntegerGrade006Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade006Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade006Part00000.size = 56 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade006Part00000 = 347304360249511479953563211481109198207052624278845833827060410101182825284984511744466856745589325497326776572968960 := by decide +kernel

theorem group_length : firstCenterIntegerGrade006Group000.size = 56 := by
  simp only [firstCenterIntegerGrade006Group000, len0]

theorem group_energy : energy firstCenterIntegerGrade006Group000 = 347304360249511479953563211481109198207052624278845833827060410101182825284984511744466856745589325497326776572968960 := by
  simp only [firstCenterIntegerGrade006Group000, sum0]

end Grothe.UpperChaos.TaylorFirstIntegerGrade006Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade006Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade006Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
