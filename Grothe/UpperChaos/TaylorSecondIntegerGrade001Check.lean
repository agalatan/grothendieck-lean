import Grothe.UpperChaos.TaylorSecondIntegerGrade001Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade001Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade001Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade001.size = 6 := by
  simp only [secondCenterIntegerGrade001, TaylorSecondIntegerGrade001Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade001.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    550713061837906894625835778427965193318348593259091797272875962787101193022679534209575315509571045124101300551680 := by
  change energy secondCenterIntegerGrade001 = _
  simp only [secondCenterIntegerGrade001, TaylorSecondIntegerGrade001Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade001Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade001Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
