import Grothe.UpperChaos.TaylorFirstIntegerGrade030Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade030Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade030Group001Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade030Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade030.size = 992 := by
  simp only [firstCenterIntegerGrade030, Array.size_append, TaylorFirstIntegerGrade030Group000Check.group_length, TaylorFirstIntegerGrade030Group001Check.group_length]

theorem grade_energy : firstCenterIntegerGrade030.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    3656508368451534995034549257017556685335888613980195253583283773674273320699093211961786857798817254661677513703424 := by
  change energy firstCenterIntegerGrade030 = _
  simp only [firstCenterIntegerGrade030, energy_append, TaylorFirstIntegerGrade030Group000Check.group_energy, TaylorFirstIntegerGrade030Group001Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade030Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade030Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade030Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
