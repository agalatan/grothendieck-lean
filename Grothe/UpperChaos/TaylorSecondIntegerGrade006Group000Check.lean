import Grothe.UpperChaos.TaylorSecondIntegerGrade006Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade006Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade006Part00000.size = 56 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade006Part00000 = 340273243718252809867815280245663811422269930660496717264512854708883319858801539507195385522567983948358844678144 := by decide +kernel

theorem group_length : secondCenterIntegerGrade006Group000.size = 56 := by
  simp only [secondCenterIntegerGrade006Group000, len0]

theorem group_energy : energy secondCenterIntegerGrade006Group000 = 340273243718252809867815280245663811422269930660496717264512854708883319858801539507195385522567983948358844678144 := by
  simp only [secondCenterIntegerGrade006Group000, sum0]

end Grothe.UpperChaos.TaylorSecondIntegerGrade006Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade006Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade006Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
