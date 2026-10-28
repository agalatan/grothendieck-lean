import Grothe.UpperChaos.TaylorSecondIntegerGrade011Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade011Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade011Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade011.size = 156 := by
  simp only [secondCenterIntegerGrade011, TaylorSecondIntegerGrade011Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade011.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    69381403869335098861374341335710900488840724264675186328403659830560626283395265272619702095765148032081057546240 := by
  change energy secondCenterIntegerGrade011 = _
  simp only [secondCenterIntegerGrade011, TaylorSecondIntegerGrade011Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade011Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade011Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade011Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
