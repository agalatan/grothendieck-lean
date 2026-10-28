import Grothe.UpperChaos.TaylorSecondIntegerGrade017Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade017Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade017Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade017.size = 342 := by
  simp only [secondCenterIntegerGrade017, TaylorSecondIntegerGrade017Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade017.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    41021288428354590473077640055943463121279555129702180346131734346414387357858871344823763682123732011491757391872 := by
  change energy secondCenterIntegerGrade017 = _
  simp only [secondCenterIntegerGrade017, TaylorSecondIntegerGrade017Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade017Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade017Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade017Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
