import Grothe.UpperChaos.TaylorFirstIntegerGrade056Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade056Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade056Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade056Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade056Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade056Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade056Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade056Group006Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade056Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade056.size = 3306 := by
  simp only [firstCenterIntegerGrade056, Array.size_append, TaylorFirstIntegerGrade056Group000Check.group_length, TaylorFirstIntegerGrade056Group001Check.group_length, TaylorFirstIntegerGrade056Group002Check.group_length, TaylorFirstIntegerGrade056Group003Check.group_length, TaylorFirstIntegerGrade056Group004Check.group_length, TaylorFirstIntegerGrade056Group005Check.group_length, TaylorFirstIntegerGrade056Group006Check.group_length]

theorem grade_energy : firstCenterIntegerGrade056.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    1217379917105983069897323279470828547701180381215159383018272502916896059661216955276216265540859202899002360070144 := by
  change energy firstCenterIntegerGrade056 = _
  simp only [firstCenterIntegerGrade056, energy_append, TaylorFirstIntegerGrade056Group000Check.group_energy, TaylorFirstIntegerGrade056Group001Check.group_energy, TaylorFirstIntegerGrade056Group002Check.group_energy, TaylorFirstIntegerGrade056Group003Check.group_energy, TaylorFirstIntegerGrade056Group004Check.group_energy, TaylorFirstIntegerGrade056Group005Check.group_energy, TaylorFirstIntegerGrade056Group006Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade056Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade056Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade056Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
