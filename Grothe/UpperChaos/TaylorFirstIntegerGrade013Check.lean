import Grothe.UpperChaos.TaylorFirstIntegerGrade013Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade013Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade013Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade013.size = 210 := by
  simp only [firstCenterIntegerGrade013, TaylorFirstIntegerGrade013Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade013.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    23222110958379544849145366284391542200925889497366020801551451469786766861761771044428784794123924834732627795640320 := by
  change energy firstCenterIntegerGrade013 = _
  simp only [firstCenterIntegerGrade013, TaylorFirstIntegerGrade013Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade013Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade013Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade013Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
