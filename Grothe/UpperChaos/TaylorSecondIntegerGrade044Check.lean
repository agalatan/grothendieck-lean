import Grothe.UpperChaos.TaylorSecondIntegerGrade044Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade044Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade044Group001Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade044Group002Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade044Group003Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade044Group004Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade044Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade044.size = 2070 := by
  simp only [secondCenterIntegerGrade044, Array.size_append, TaylorSecondIntegerGrade044Group000Check.group_length, TaylorSecondIntegerGrade044Group001Check.group_length, TaylorSecondIntegerGrade044Group002Check.group_length, TaylorSecondIntegerGrade044Group003Check.group_length, TaylorSecondIntegerGrade044Group004Check.group_length]

theorem grade_energy : secondCenterIntegerGrade044.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    2462481835954785640870024093656323247708198053441324759968118737563351469486330418680994860529863738226993266688 := by
  change energy secondCenterIntegerGrade044 = _
  simp only [secondCenterIntegerGrade044, energy_append, TaylorSecondIntegerGrade044Group000Check.group_energy, TaylorSecondIntegerGrade044Group001Check.group_energy, TaylorSecondIntegerGrade044Group002Check.group_energy, TaylorSecondIntegerGrade044Group003Check.group_energy, TaylorSecondIntegerGrade044Group004Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade044Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade044Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade044Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
