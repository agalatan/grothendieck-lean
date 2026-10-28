import Grothe.UpperChaos.TaylorFirstIntegerGrade008Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade008Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade008Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade008.size = 90 := by
  simp only [firstCenterIntegerGrade008, TaylorFirstIntegerGrade008Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade008.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    57378759080185245179769833139799010831137017829438485461860990271141241667132687985796704911417387183985899413176320 := by
  change energy firstCenterIntegerGrade008 = _
  simp only [firstCenterIntegerGrade008, TaylorFirstIntegerGrade008Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade008Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade008Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
