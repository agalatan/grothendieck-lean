import Grothe.UpperChaos.TaylorSecondIntegerGrade015Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade015Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade015Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade015.size = 272 := by
  simp only [secondCenterIntegerGrade015, TaylorSecondIntegerGrade015Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade015.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    62337183593881668167805498141279934701080575638621655515279062445377673617617209836835008695000288632281401131008 := by
  change energy secondCenterIntegerGrade015 = _
  simp only [secondCenterIntegerGrade015, TaylorSecondIntegerGrade015Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade015Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade015Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade015Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
