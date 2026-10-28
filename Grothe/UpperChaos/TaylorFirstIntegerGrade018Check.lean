import Grothe.UpperChaos.TaylorFirstIntegerGrade018Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade018Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade018Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade018.size = 380 := by
  simp only [firstCenterIntegerGrade018, TaylorFirstIntegerGrade018Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade018.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    8983823528493290718488019059194094316343447160815346376461011072430717588876257028196793057811688020270877109125120 := by
  change energy firstCenterIntegerGrade018 = _
  simp only [firstCenterIntegerGrade018, TaylorFirstIntegerGrade018Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade018Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade018Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade018Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
