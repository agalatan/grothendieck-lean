import Grothe.UpperChaos.TaylorSecondIntegerGrade034Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade034Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade034Group001Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade034Group002Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade034Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade034.size = 1260 := by
  simp only [secondCenterIntegerGrade034, Array.size_append, TaylorSecondIntegerGrade034Group000Check.group_length, TaylorSecondIntegerGrade034Group001Check.group_length, TaylorSecondIntegerGrade034Group002Check.group_length]

theorem grade_energy : secondCenterIntegerGrade034.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    4994073528798014668983298932715059896198766951260609815543333468167505367428331487403852653226128117442329706496 := by
  change energy secondCenterIntegerGrade034 = _
  simp only [secondCenterIntegerGrade034, energy_append, TaylorSecondIntegerGrade034Group000Check.group_energy, TaylorSecondIntegerGrade034Group001Check.group_energy, TaylorSecondIntegerGrade034Group002Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade034Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade034Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade034Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
