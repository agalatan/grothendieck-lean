import Grothe.UpperChaos.TaylorFirstIntegerGrade002Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade002Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade002Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade002.size = 12 := by
  simp only [firstCenterIntegerGrade002, TaylorFirstIntegerGrade002Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade002.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    12519390462579572764674714821174980623286038625699712445560354694735921877639283632717272019355817384764306919201439744 := by
  change energy firstCenterIntegerGrade002 = _
  simp only [firstCenterIntegerGrade002, TaylorFirstIntegerGrade002Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade002Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade002Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
