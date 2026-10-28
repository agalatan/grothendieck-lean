import Grothe.UpperChaos.TaylorFirstIntegerGrade004Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade004Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade004Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade004.size = 30 := by
  simp only [firstCenterIntegerGrade004, TaylorFirstIntegerGrade004Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade004.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    2823999446533958230505261115753826347105613303522498928356446016937686203851437146819501185746171774571298683199946752 := by
  change energy firstCenterIntegerGrade004 = _
  simp only [firstCenterIntegerGrade004, TaylorFirstIntegerGrade004Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade004Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade004Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
