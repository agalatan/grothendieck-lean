import Grothe.UpperChaos.TaylorSecondIntegerGrade035Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade035Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade035Group001Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade035Group002Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade035Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade035.size = 1332 := by
  simp only [secondCenterIntegerGrade035, Array.size_append, TaylorSecondIntegerGrade035Group000Check.group_length, TaylorSecondIntegerGrade035Group001Check.group_length, TaylorSecondIntegerGrade035Group002Check.group_length]

theorem grade_energy : secondCenterIntegerGrade035.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    6170857627489125668811490849039597491723680561590181267962484407331522487865632189880223991285270325344040124416 := by
  change energy secondCenterIntegerGrade035 = _
  simp only [secondCenterIntegerGrade035, energy_append, TaylorSecondIntegerGrade035Group000Check.group_energy, TaylorSecondIntegerGrade035Group001Check.group_energy, TaylorSecondIntegerGrade035Group002Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade035Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade035Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade035Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
