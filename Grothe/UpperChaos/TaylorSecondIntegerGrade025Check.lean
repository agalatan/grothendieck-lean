import Grothe.UpperChaos.TaylorSecondIntegerGrade025Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade025Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade025Group001Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade025Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade025.size = 702 := by
  simp only [secondCenterIntegerGrade025, Array.size_append, TaylorSecondIntegerGrade025Group000Check.group_length, TaylorSecondIntegerGrade025Group001Check.group_length]

theorem grade_energy : secondCenterIntegerGrade025.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    13708271072155583416997226522721774377474196538090853881628905207358090626263795748293561892366781300106258808832 := by
  change energy secondCenterIntegerGrade025 = _
  simp only [secondCenterIntegerGrade025, energy_append, TaylorSecondIntegerGrade025Group000Check.group_energy, TaylorSecondIntegerGrade025Group001Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade025Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade025Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade025Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
