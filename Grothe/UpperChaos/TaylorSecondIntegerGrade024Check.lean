import Grothe.UpperChaos.TaylorSecondIntegerGrade024Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade024Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade024Group001Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade024Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade024.size = 650 := by
  simp only [secondCenterIntegerGrade024, Array.size_append, TaylorSecondIntegerGrade024Group000Check.group_length, TaylorSecondIntegerGrade024Group001Check.group_length]

theorem grade_energy : secondCenterIntegerGrade024.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    14663711140695581629643284520156436510994868009853237459708895231343121093583360453621749730422120421928642543616 := by
  change energy secondCenterIntegerGrade024 = _
  simp only [secondCenterIntegerGrade024, energy_append, TaylorSecondIntegerGrade024Group000Check.group_energy, TaylorSecondIntegerGrade024Group001Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade024Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade024Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade024Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
