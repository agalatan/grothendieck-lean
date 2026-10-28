import Grothe.UpperChaos.TaylorFirstIntegerGrade023Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade023Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade023Group001Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade023Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade023.size = 600 := by
  simp only [firstCenterIntegerGrade023, Array.size_append, TaylorFirstIntegerGrade023Group000Check.group_length, TaylorFirstIntegerGrade023Group001Check.group_length]

theorem grade_energy : firstCenterIntegerGrade023.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    5408136332461615196814494134158273576496564316487084823776274583458474351783057658747546983599391731519339460820992 := by
  change energy firstCenterIntegerGrade023 = _
  simp only [firstCenterIntegerGrade023, energy_append, TaylorFirstIntegerGrade023Group000Check.group_energy, TaylorFirstIntegerGrade023Group001Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade023Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade023Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade023Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
