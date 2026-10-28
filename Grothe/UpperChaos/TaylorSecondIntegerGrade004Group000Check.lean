import Grothe.UpperChaos.TaylorSecondIntegerGrade004Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade004Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade004Part00000.size = 30 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade004Part00000 = 625218570545062682224803600188592948135117106588497759846473204246007710234517773379667923712878027855860919697408 := by decide +kernel

theorem group_length : secondCenterIntegerGrade004Group000.size = 30 := by
  simp only [secondCenterIntegerGrade004Group000, len0]

theorem group_energy : energy secondCenterIntegerGrade004Group000 = 625218570545062682224803600188592948135117106588497759846473204246007710234517773379667923712878027855860919697408 := by
  simp only [secondCenterIntegerGrade004Group000, sum0]

end Grothe.UpperChaos.TaylorSecondIntegerGrade004Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade004Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade004Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
