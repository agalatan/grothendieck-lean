import Grothe.UpperChaos.TaylorFirstIntegerGrade016Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade016Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade016Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade016.size = 306 := by
  simp only [firstCenterIntegerGrade016, TaylorFirstIntegerGrade016Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade016.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    10506894057104143877660740813344126015195947146463849470305787172655299679527859031675222832280719576131827318915072 := by
  change energy firstCenterIntegerGrade016 = _
  simp only [firstCenterIntegerGrade016, TaylorFirstIntegerGrade016Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade016Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade016Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade016Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
