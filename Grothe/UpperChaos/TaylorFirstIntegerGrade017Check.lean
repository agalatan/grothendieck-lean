import Grothe.UpperChaos.TaylorFirstIntegerGrade017Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade017Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade017Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade017.size = 342 := by
  simp only [firstCenterIntegerGrade017, TaylorFirstIntegerGrade017Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade017.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    9230598591241079122524709855054917115564093061847058610891053566012905660183653922575591473136456605816320119799808 := by
  change energy firstCenterIntegerGrade017 = _
  simp only [firstCenterIntegerGrade017, TaylorFirstIntegerGrade017Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade017Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade017Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade017Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
