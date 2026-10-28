import Grothe.UpperChaos.TaylorSecondIntegerGrade005Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade005Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade005Part00000.size = 42 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade005Part00000 = 652637686689447235321433856355467531751963203371265790864995137640964854956460265712477938252310201258885957812224 := by decide +kernel

theorem group_length : secondCenterIntegerGrade005Group000.size = 42 := by
  simp only [secondCenterIntegerGrade005Group000, len0]

theorem group_energy : energy secondCenterIntegerGrade005Group000 = 652637686689447235321433856355467531751963203371265790864995137640964854956460265712477938252310201258885957812224 := by
  simp only [secondCenterIntegerGrade005Group000, sum0]

end Grothe.UpperChaos.TaylorSecondIntegerGrade005Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade005Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade005Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
