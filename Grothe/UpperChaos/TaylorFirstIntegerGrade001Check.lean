import Grothe.UpperChaos.TaylorFirstIntegerGrade001Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade001Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade001Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade001.size = 6 := by
  simp only [firstCenterIntegerGrade001, TaylorFirstIntegerGrade001Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade001.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    3911241011369658788640428711042537896458051896923634900690968801303618879628719078476609145072417488818823533479067648 := by
  change energy firstCenterIntegerGrade001 = _
  simp only [firstCenterIntegerGrade001, TaylorFirstIntegerGrade001Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade001Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade001Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
