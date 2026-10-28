import Grothe.UpperChaos.TaylorFirstIntegerGrade003Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade003Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade003Part00000.size = 20 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade003Part00000 = 3346160257074208889833500063705432002009152127375031896555295909122489784698841142678225160602783802412307367789068288 := by decide +kernel

theorem group_length : firstCenterIntegerGrade003Group000.size = 20 := by
  simp only [firstCenterIntegerGrade003Group000, len0]

theorem group_energy : energy firstCenterIntegerGrade003Group000 = 3346160257074208889833500063705432002009152127375031896555295909122489784698841142678225160602783802412307367789068288 := by
  simp only [firstCenterIntegerGrade003Group000, sum0]

end Grothe.UpperChaos.TaylorFirstIntegerGrade003Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade003Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade003Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
