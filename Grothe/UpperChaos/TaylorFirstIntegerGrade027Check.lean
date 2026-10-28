import Grothe.UpperChaos.TaylorFirstIntegerGrade027Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade027Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade027Group001Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade027Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade027.size = 812 := by
  simp only [firstCenterIntegerGrade027, Array.size_append, TaylorFirstIntegerGrade027Group000Check.group_length, TaylorFirstIntegerGrade027Group001Check.group_length]

theorem grade_energy : firstCenterIntegerGrade027.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    4059056274214291178525522667363787535918290460676751976702017157479757256549706351884835357777536629468223279988736 := by
  change energy firstCenterIntegerGrade027 = _
  simp only [firstCenterIntegerGrade027, energy_append, TaylorFirstIntegerGrade027Group000Check.group_energy, TaylorFirstIntegerGrade027Group001Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade027Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade027Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade027Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
