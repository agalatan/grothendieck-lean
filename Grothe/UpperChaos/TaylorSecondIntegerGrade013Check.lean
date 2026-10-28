import Grothe.UpperChaos.TaylorSecondIntegerGrade013Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade013Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade013Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade013.size = 210 := by
  simp only [secondCenterIntegerGrade013, TaylorSecondIntegerGrade013Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade013.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    71516131932697159853254519831108021282040264369687465726952052856728311526130017285304572882526540525734037815296 := by
  change energy secondCenterIntegerGrade013 = _
  simp only [secondCenterIntegerGrade013, TaylorSecondIntegerGrade013Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade013Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade013Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade013Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
