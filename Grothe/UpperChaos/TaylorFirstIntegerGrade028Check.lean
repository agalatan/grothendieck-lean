import Grothe.UpperChaos.TaylorFirstIntegerGrade028Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade028Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade028Group001Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade028Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade028.size = 870 := by
  simp only [firstCenterIntegerGrade028, Array.size_append, TaylorFirstIntegerGrade028Group000Check.group_length, TaylorFirstIntegerGrade028Group001Check.group_length]

theorem grade_energy : firstCenterIntegerGrade028.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    3699565722992777233640362547841948779352447763581416184757738163546191410603696423104635586021736786013982566645760 := by
  change energy firstCenterIntegerGrade028 = _
  simp only [firstCenterIntegerGrade028, energy_append, TaylorFirstIntegerGrade028Group000Check.group_energy, TaylorFirstIntegerGrade028Group001Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade028Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade028Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade028Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
