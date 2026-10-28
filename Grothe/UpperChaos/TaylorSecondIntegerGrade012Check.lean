import Grothe.UpperChaos.TaylorSecondIntegerGrade012Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade012Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade012Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade012.size = 182 := by
  simp only [secondCenterIntegerGrade012, TaylorSecondIntegerGrade012Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade012.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    32251862840490197374696695780141738474118385239453450723830234383780661439017993437200862164663092304019397279744 := by
  change energy secondCenterIntegerGrade012 = _
  simp only [secondCenterIntegerGrade012, TaylorSecondIntegerGrade012Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade012Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade012Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade012Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
