import Grothe.UpperChaos.TaylorSecondIntegerGrade000Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade000Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade000Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade000.size = 2 := by
  simp only [secondCenterIntegerGrade000, TaylorSecondIntegerGrade000Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade000.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    192561790502741432262060763123683636638892866994040220566725108078100712499874094128590707862608859564657650696192 := by
  change energy secondCenterIntegerGrade000 = _
  simp only [secondCenterIntegerGrade000, TaylorSecondIntegerGrade000Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade000Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade000Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
