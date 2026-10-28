import Grothe.UpperChaos.TaylorFirstIntegerGrade006Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade006Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade006Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade006.size = 56 := by
  simp only [firstCenterIntegerGrade006, TaylorFirstIntegerGrade006Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade006.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    347304360249511479953563211481109198207052624278845833827060410101182825284984511744466856745589325497326776572968960 := by
  change energy firstCenterIntegerGrade006 = _
  simp only [firstCenterIntegerGrade006, TaylorFirstIntegerGrade006Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade006Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade006Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
