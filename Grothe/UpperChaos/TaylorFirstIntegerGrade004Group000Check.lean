import Grothe.UpperChaos.TaylorFirstIntegerGrade004Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade004Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade004Part00000.size = 30 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade004Part00000 = 2823999446533958230505261115753826347105613303522498928356446016937686203851437146819501185746171774571298683199946752 := by decide +kernel

theorem group_length : firstCenterIntegerGrade004Group000.size = 30 := by
  simp only [firstCenterIntegerGrade004Group000, len0]

theorem group_energy : energy firstCenterIntegerGrade004Group000 = 2823999446533958230505261115753826347105613303522498928356446016937686203851437146819501185746171774571298683199946752 := by
  simp only [firstCenterIntegerGrade004Group000, sum0]

end Grothe.UpperChaos.TaylorFirstIntegerGrade004Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade004Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade004Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
