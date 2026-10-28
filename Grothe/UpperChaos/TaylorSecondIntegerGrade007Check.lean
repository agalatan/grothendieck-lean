import Grothe.UpperChaos.TaylorSecondIntegerGrade007Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade007Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade007Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade007.size = 72 := by
  simp only [secondCenterIntegerGrade007, TaylorSecondIntegerGrade007Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade007.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    338468048881673872756833588839912819182037070193615217299740366266808226617889039525971998548461332646841183895552 := by
  change energy secondCenterIntegerGrade007 = _
  simp only [secondCenterIntegerGrade007, TaylorSecondIntegerGrade007Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade007Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade007Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
