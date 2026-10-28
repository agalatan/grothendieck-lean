import Grothe.UpperChaos.TaylorFirstIntegerGrade026Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade026Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade026Group001Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade026Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade026.size = 756 := by
  simp only [firstCenterIntegerGrade026, Array.size_append, TaylorFirstIntegerGrade026Group000Check.group_length, TaylorFirstIntegerGrade026Group001Check.group_length]

theorem grade_energy : firstCenterIntegerGrade026.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    4406982711861016211494658278191964124910140080125421750774122037167843492368414053014028136328896275987350633316352 := by
  change energy firstCenterIntegerGrade026 = _
  simp only [firstCenterIntegerGrade026, energy_append, TaylorFirstIntegerGrade026Group000Check.group_energy, TaylorFirstIntegerGrade026Group001Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade026Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade026Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade026Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
