import Grothe.UpperChaos.TaylorFirstIntegerGrade051Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade051Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade051Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade051Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade051Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade051Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade051Group005Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade051Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade051.size = 2756 := by
  simp only [firstCenterIntegerGrade051, Array.size_append, TaylorFirstIntegerGrade051Group000Check.group_length, TaylorFirstIntegerGrade051Group001Check.group_length, TaylorFirstIntegerGrade051Group002Check.group_length, TaylorFirstIntegerGrade051Group003Check.group_length, TaylorFirstIntegerGrade051Group004Check.group_length, TaylorFirstIntegerGrade051Group005Check.group_length]

theorem grade_energy : firstCenterIntegerGrade051.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    1173935776091519488361998635329861252845431376287590510432718874713410091205357672785176447437683903543202933637120 := by
  change energy firstCenterIntegerGrade051 = _
  simp only [firstCenterIntegerGrade051, energy_append, TaylorFirstIntegerGrade051Group000Check.group_energy, TaylorFirstIntegerGrade051Group001Check.group_energy, TaylorFirstIntegerGrade051Group002Check.group_energy, TaylorFirstIntegerGrade051Group003Check.group_energy, TaylorFirstIntegerGrade051Group004Check.group_energy, TaylorFirstIntegerGrade051Group005Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade051Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade051Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade051Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
