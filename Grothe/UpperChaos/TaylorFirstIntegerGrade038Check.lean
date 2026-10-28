import Grothe.UpperChaos.TaylorFirstIntegerGrade038Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade038Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade038Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade038Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade038Group003Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade038Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade038.size = 1560 := by
  simp only [firstCenterIntegerGrade038, Array.size_append, TaylorFirstIntegerGrade038Group000Check.group_length, TaylorFirstIntegerGrade038Group001Check.group_length, TaylorFirstIntegerGrade038Group002Check.group_length, TaylorFirstIntegerGrade038Group003Check.group_length]

theorem grade_energy : firstCenterIntegerGrade038.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    1506665887930052073223383770890888378241431187601462497939434579498763090838651083358080563078646565303151807692800 := by
  change energy firstCenterIntegerGrade038 = _
  simp only [firstCenterIntegerGrade038, energy_append, TaylorFirstIntegerGrade038Group000Check.group_energy, TaylorFirstIntegerGrade038Group001Check.group_energy, TaylorFirstIntegerGrade038Group002Check.group_energy, TaylorFirstIntegerGrade038Group003Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade038Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade038Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade038Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
