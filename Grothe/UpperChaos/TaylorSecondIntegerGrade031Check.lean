import Grothe.UpperChaos.TaylorSecondIntegerGrade031Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade031Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade031Group001Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade031Group002Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade031Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade031.size = 1056 := by
  simp only [secondCenterIntegerGrade031, Array.size_append, TaylorSecondIntegerGrade031Group000Check.group_length, TaylorSecondIntegerGrade031Group001Check.group_length, TaylorSecondIntegerGrade031Group002Check.group_length]

theorem grade_energy : secondCenterIntegerGrade031.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    8011895372473173995556221576151848056560237864835453145991593073419881327246533544686604474433611677474616246272 := by
  change energy secondCenterIntegerGrade031 = _
  simp only [secondCenterIntegerGrade031, energy_append, TaylorSecondIntegerGrade031Group000Check.group_energy, TaylorSecondIntegerGrade031Group001Check.group_energy, TaylorSecondIntegerGrade031Group002Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade031Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade031Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade031Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
