import Grothe.UpperChaos.TaylorFirstIntegerGrade024Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade024Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade024Group001Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade024Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade024.size = 650 := by
  simp only [firstCenterIntegerGrade024, Array.size_append, TaylorFirstIntegerGrade024Group000Check.group_length, TaylorFirstIntegerGrade024Group001Check.group_length]

theorem grade_energy : firstCenterIntegerGrade024.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    4561746547781436330930185280770422835815431276546791814636068693681847396902125485865950466022170743923904234913792 := by
  change energy firstCenterIntegerGrade024 = _
  simp only [firstCenterIntegerGrade024, energy_append, TaylorFirstIntegerGrade024Group000Check.group_energy, TaylorFirstIntegerGrade024Group001Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade024Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade024Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade024Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
