import Grothe.UpperChaos.TaylorSecondIntegerGrade008Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade008Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade008Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade008.size = 90 := by
  simp only [secondCenterIntegerGrade008, TaylorSecondIntegerGrade008Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade008.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    210861364164241524169191422234304069420562324259656490705794958645855008467749198251194491203726788548811785502720 := by
  change energy secondCenterIntegerGrade008 = _
  simp only [secondCenterIntegerGrade008, TaylorSecondIntegerGrade008Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade008Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade008Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
