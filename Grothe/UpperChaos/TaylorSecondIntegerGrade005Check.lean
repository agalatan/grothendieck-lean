import Grothe.UpperChaos.TaylorSecondIntegerGrade005Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade005Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade005Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade005.size = 42 := by
  simp only [secondCenterIntegerGrade005, TaylorSecondIntegerGrade005Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade005.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    652637686689447235321433856355467531751963203371265790864995137640964854956460265712477938252310201258885957812224 := by
  change energy secondCenterIntegerGrade005 = _
  simp only [secondCenterIntegerGrade005, TaylorSecondIntegerGrade005Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade005Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade005Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
