import Grothe.UpperChaos.TaylorFirstIntegerGrade001Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade001Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade001Part00000.size = 6 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade001Part00000 = 3911241011369658788640428711042537896458051896923634900690968801303618879628719078476609145072417488818823533479067648 := by decide +kernel

theorem group_length : firstCenterIntegerGrade001Group000.size = 6 := by
  simp only [firstCenterIntegerGrade001Group000, len0]

theorem group_energy : energy firstCenterIntegerGrade001Group000 = 3911241011369658788640428711042537896458051896923634900690968801303618879628719078476609145072417488818823533479067648 := by
  simp only [firstCenterIntegerGrade001Group000, sum0]

end Grothe.UpperChaos.TaylorFirstIntegerGrade001Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade001Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade001Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
