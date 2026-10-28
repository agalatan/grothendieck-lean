import Grothe.UpperChaos.TaylorFirstIntegerGrade000Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade000Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade000Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade000.size = 2 := by
  simp only [firstCenterIntegerGrade000, TaylorFirstIntegerGrade000Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade000.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    1731414224949200957893676281539875717006855473698817548582497275659777964322286547117552004641992518557438019467476992 := by
  change energy firstCenterIntegerGrade000 = _
  simp only [firstCenterIntegerGrade000, TaylorFirstIntegerGrade000Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade000Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade000Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
