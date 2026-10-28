import Grothe.UpperChaos.TaylorSecondIntegerGrade014Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade014Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade014Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade014.size = 240 := by
  simp only [secondCenterIntegerGrade014, TaylorSecondIntegerGrade014Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade014.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    81851894401620038888332289475643589714998578909687025190969260084491477812942987770196263727849032907842356510720 := by
  change energy secondCenterIntegerGrade014 = _
  simp only [secondCenterIntegerGrade014, TaylorSecondIntegerGrade014Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade014Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade014Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade014Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
