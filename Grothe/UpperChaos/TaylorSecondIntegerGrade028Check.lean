import Grothe.UpperChaos.TaylorSecondIntegerGrade028Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade028Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade028Group001Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade028Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade028.size = 870 := by
  simp only [secondCenterIntegerGrade028, Array.size_append, TaylorSecondIntegerGrade028Group000Check.group_length, TaylorSecondIntegerGrade028Group001Check.group_length]

theorem grade_energy : secondCenterIntegerGrade028.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    11161134167957757077850363063743950827737228722821531376933923540430057847810645586360931985774536047236309057536 := by
  change energy secondCenterIntegerGrade028 = _
  simp only [secondCenterIntegerGrade028, energy_append, TaylorSecondIntegerGrade028Group000Check.group_energy, TaylorSecondIntegerGrade028Group001Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade028Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade028Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade028Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
