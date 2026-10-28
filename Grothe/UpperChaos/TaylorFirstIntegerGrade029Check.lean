import Grothe.UpperChaos.TaylorFirstIntegerGrade029Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade029Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade029Group001Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade029Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade029.size = 930 := by
  simp only [firstCenterIntegerGrade029, Array.size_append, TaylorFirstIntegerGrade029Group000Check.group_length, TaylorFirstIntegerGrade029Group001Check.group_length]

theorem grade_energy : firstCenterIntegerGrade029.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    3656311928021940158673884303256241025957581686979962324095959397531795161231407049695769771132757168944689021190144 := by
  change energy firstCenterIntegerGrade029 = _
  simp only [firstCenterIntegerGrade029, energy_append, TaylorFirstIntegerGrade029Group000Check.group_energy, TaylorFirstIntegerGrade029Group001Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade029Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade029Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade029Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
