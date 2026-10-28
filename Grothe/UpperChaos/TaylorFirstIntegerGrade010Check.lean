import Grothe.UpperChaos.TaylorFirstIntegerGrade010Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade010Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade010Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade010.size = 132 := by
  simp only [firstCenterIntegerGrade010, TaylorFirstIntegerGrade010Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade010.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    41574451462496868351920573095644893154978988590686972980610850809297056063500759464431076931538169729764943447719936 := by
  change energy firstCenterIntegerGrade010 = _
  simp only [firstCenterIntegerGrade010, TaylorFirstIntegerGrade010Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade010Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade010Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
