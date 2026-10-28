import Grothe.UpperChaos.TaylorFirstIntegerGrade035Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade035Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade035Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade035Group002Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade035Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade035.size = 1332 := by
  simp only [firstCenterIntegerGrade035, Array.size_append, TaylorFirstIntegerGrade035Group000Check.group_length, TaylorFirstIntegerGrade035Group001Check.group_length, TaylorFirstIntegerGrade035Group002Check.group_length]

theorem grade_energy : firstCenterIntegerGrade035.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    2069714775765126265484940315966312420788722934779043850832072149852742080246502314548429233787826891961890970271744 := by
  change energy firstCenterIntegerGrade035 = _
  simp only [firstCenterIntegerGrade035, energy_append, TaylorFirstIntegerGrade035Group000Check.group_energy, TaylorFirstIntegerGrade035Group001Check.group_energy, TaylorFirstIntegerGrade035Group002Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade035Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade035Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade035Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
