import Grothe.UpperChaos.TaylorSecondIntegerGrade004Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade004Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade004Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade004.size = 30 := by
  simp only [secondCenterIntegerGrade004, TaylorSecondIntegerGrade004Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade004.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    625218570545062682224803600188592948135117106588497759846473204246007710234517773379667923712878027855860919697408 := by
  change energy secondCenterIntegerGrade004 = _
  simp only [secondCenterIntegerGrade004, TaylorSecondIntegerGrade004Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade004Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade004Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
