import Grothe.UpperChaos.TaylorSecondIntegerGrade009Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade009Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade009Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade009.size = 110 := by
  simp only [secondCenterIntegerGrade009, TaylorSecondIntegerGrade009Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade009.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    134671180712842614479320255705358055042559056063174791310068421045516439310672728932025583477462230093401581158400 := by
  change energy secondCenterIntegerGrade009 = _
  simp only [secondCenterIntegerGrade009, TaylorSecondIntegerGrade009Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade009Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade009Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
