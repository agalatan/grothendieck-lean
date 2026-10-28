import Grothe.UpperChaos.TaylorSecondIntegerGrade037Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade037Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade037Group001Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade037Group002Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade037Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade037.size = 1482 := by
  simp only [secondCenterIntegerGrade037, Array.size_append, TaylorSecondIntegerGrade037Group000Check.group_length, TaylorSecondIntegerGrade037Group001Check.group_length, TaylorSecondIntegerGrade037Group002Check.group_length]

theorem grade_energy : secondCenterIntegerGrade037.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    4760884025760827682818498594426671902730430691631843326387556408606454365535036408394030483303844620393737355264 := by
  change energy secondCenterIntegerGrade037 = _
  simp only [secondCenterIntegerGrade037, energy_append, TaylorSecondIntegerGrade037Group000Check.group_energy, TaylorSecondIntegerGrade037Group001Check.group_energy, TaylorSecondIntegerGrade037Group002Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade037Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade037Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade037Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
