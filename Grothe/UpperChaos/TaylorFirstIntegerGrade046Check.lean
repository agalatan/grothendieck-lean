import Grothe.UpperChaos.TaylorFirstIntegerGrade046Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade046Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade046Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade046Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade046Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade046Group004Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade046Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade046.size = 2256 := by
  simp only [firstCenterIntegerGrade046, Array.size_append, TaylorFirstIntegerGrade046Group000Check.group_length, TaylorFirstIntegerGrade046Group001Check.group_length, TaylorFirstIntegerGrade046Group002Check.group_length, TaylorFirstIntegerGrade046Group003Check.group_length, TaylorFirstIntegerGrade046Group004Check.group_length]

theorem grade_energy : firstCenterIntegerGrade046.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    3930679387589929725807642504064303193915081963818145798383768478722037572180586993253789833434648467287982397718528 := by
  change energy firstCenterIntegerGrade046 = _
  simp only [firstCenterIntegerGrade046, energy_append, TaylorFirstIntegerGrade046Group000Check.group_energy, TaylorFirstIntegerGrade046Group001Check.group_energy, TaylorFirstIntegerGrade046Group002Check.group_energy, TaylorFirstIntegerGrade046Group003Check.group_energy, TaylorFirstIntegerGrade046Group004Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade046Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade046Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade046Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
