import Grothe.UpperChaos.TaylorFirstIntegerGrade062Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade062Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade062Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade062Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade062Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade062Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade062Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade062Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade062Group007Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade062Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade062.size = 4032 := by
  simp only [firstCenterIntegerGrade062, Array.size_append, TaylorFirstIntegerGrade062Group000Check.group_length, TaylorFirstIntegerGrade062Group001Check.group_length, TaylorFirstIntegerGrade062Group002Check.group_length, TaylorFirstIntegerGrade062Group003Check.group_length, TaylorFirstIntegerGrade062Group004Check.group_length, TaylorFirstIntegerGrade062Group005Check.group_length, TaylorFirstIntegerGrade062Group006Check.group_length, TaylorFirstIntegerGrade062Group007Check.group_length]

theorem grade_energy : firstCenterIntegerGrade062.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    655760698294419355303185163864697044152372740365635511996818436417898317004985310171479661989258629195360150487040 := by
  change energy firstCenterIntegerGrade062 = _
  simp only [firstCenterIntegerGrade062, energy_append, TaylorFirstIntegerGrade062Group000Check.group_energy, TaylorFirstIntegerGrade062Group001Check.group_energy, TaylorFirstIntegerGrade062Group002Check.group_energy, TaylorFirstIntegerGrade062Group003Check.group_energy, TaylorFirstIntegerGrade062Group004Check.group_energy, TaylorFirstIntegerGrade062Group005Check.group_energy, TaylorFirstIntegerGrade062Group006Check.group_energy, TaylorFirstIntegerGrade062Group007Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade062Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade062Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade062Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
