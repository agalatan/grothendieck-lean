import Grothe.UpperChaos.TaylorFirstIntegerGrade003Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade003Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade003Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade003.size = 20 := by
  simp only [firstCenterIntegerGrade003, TaylorFirstIntegerGrade003Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade003.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    3346160257074208889833500063705432002009152127375031896555295909122489784698841142678225160602783802412307367789068288 := by
  change energy firstCenterIntegerGrade003 = _
  simp only [firstCenterIntegerGrade003, TaylorFirstIntegerGrade003Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade003Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade003Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
