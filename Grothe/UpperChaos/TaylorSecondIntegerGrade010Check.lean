import Grothe.UpperChaos.TaylorSecondIntegerGrade010Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade010Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade010Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade010.size = 132 := by
  simp only [secondCenterIntegerGrade010, TaylorSecondIntegerGrade010Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade010.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    78827933300572882745300521375989605632411798849968581296637123831651746057652169564128179456887013261793397047296 := by
  change energy secondCenterIntegerGrade010 = _
  simp only [secondCenterIntegerGrade010, TaylorSecondIntegerGrade010Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade010Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade010Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
