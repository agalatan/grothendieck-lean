import Grothe.UpperChaos.TaylorSecondIntegerGrade006Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade006Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade006Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade006.size = 56 := by
  simp only [secondCenterIntegerGrade006, TaylorSecondIntegerGrade006Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade006.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    340273243718252809867815280245663811422269930660496717264512854708883319858801539507195385522567983948358844678144 := by
  change energy secondCenterIntegerGrade006 = _
  simp only [secondCenterIntegerGrade006, TaylorSecondIntegerGrade006Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade006Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade006Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
