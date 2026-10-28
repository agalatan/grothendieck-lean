import Grothe.UpperChaos.TaylorSecondIntegerGrade002Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade002Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade002Part00000.size = 12 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade002Part00000 = 1078128652397920453440498500246534606483183185271846620440464939376742097622867927717671607534082875655621233868800 := by decide +kernel

theorem group_length : secondCenterIntegerGrade002Group000.size = 12 := by
  simp only [secondCenterIntegerGrade002Group000, len0]

theorem group_energy : energy secondCenterIntegerGrade002Group000 = 1078128652397920453440498500246534606483183185271846620440464939376742097622867927717671607534082875655621233868800 := by
  simp only [secondCenterIntegerGrade002Group000, sum0]

end Grothe.UpperChaos.TaylorSecondIntegerGrade002Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade002Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade002Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
