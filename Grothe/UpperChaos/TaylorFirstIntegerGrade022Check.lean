import Grothe.UpperChaos.TaylorFirstIntegerGrade022Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade022Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade022Group001Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade022Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade022.size = 552 := by
  simp only [firstCenterIntegerGrade022, Array.size_append, TaylorFirstIntegerGrade022Group000Check.group_length, TaylorFirstIntegerGrade022Group001Check.group_length]

theorem grade_energy : firstCenterIntegerGrade022.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    6763623569328288305630208808621138792537990875194511070231180122127407451674619498278968318024850303083612578250752 := by
  change energy firstCenterIntegerGrade022 = _
  simp only [firstCenterIntegerGrade022, energy_append, TaylorFirstIntegerGrade022Group000Check.group_energy, TaylorFirstIntegerGrade022Group001Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade022Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade022Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade022Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
