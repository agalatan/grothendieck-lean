import Grothe.UpperChaos.TaylorFirstIntegerGrade021Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade021Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade021Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade021.size = 506 := by
  simp only [firstCenterIntegerGrade021, TaylorFirstIntegerGrade021Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade021.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    8002397311666068208452919569689351642753663426971074889271368973111340953908273146082009541518165348528378720813056 := by
  change energy firstCenterIntegerGrade021 = _
  simp only [firstCenterIntegerGrade021, TaylorFirstIntegerGrade021Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade021Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade021Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade021Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
