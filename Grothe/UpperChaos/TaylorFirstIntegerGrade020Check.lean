import Grothe.UpperChaos.TaylorFirstIntegerGrade020Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade020Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade020Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade020.size = 462 := by
  simp only [firstCenterIntegerGrade020, TaylorFirstIntegerGrade020Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade020.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    8872700014571935815553796468912569926092420782877775939000625688908396216421206000792511569298636372443634081988608 := by
  change energy firstCenterIntegerGrade020 = _
  simp only [firstCenterIntegerGrade020, TaylorFirstIntegerGrade020Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade020Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade020Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade020Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
