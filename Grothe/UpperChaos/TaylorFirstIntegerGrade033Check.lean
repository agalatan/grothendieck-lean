import Grothe.UpperChaos.TaylorFirstIntegerGrade033Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade033Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade033Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade033Group002Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade033Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade033.size = 1190 := by
  simp only [firstCenterIntegerGrade033, Array.size_append, TaylorFirstIntegerGrade033Group000Check.group_length, TaylorFirstIntegerGrade033Group001Check.group_length, TaylorFirstIntegerGrade033Group002Check.group_length]

theorem grade_energy : firstCenterIntegerGrade033.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    2006686448692724940581423500005361634076305298135199841848741473495083378997129177073406987740628248169978915717120 := by
  change energy firstCenterIntegerGrade033 = _
  simp only [firstCenterIntegerGrade033, energy_append, TaylorFirstIntegerGrade033Group000Check.group_energy, TaylorFirstIntegerGrade033Group001Check.group_energy, TaylorFirstIntegerGrade033Group002Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade033Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade033Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade033Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
