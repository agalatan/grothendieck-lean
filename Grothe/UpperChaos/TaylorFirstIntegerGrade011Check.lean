import Grothe.UpperChaos.TaylorFirstIntegerGrade011Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade011Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade011Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade011.size = 156 := by
  simp only [firstCenterIntegerGrade011, TaylorFirstIntegerGrade011Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade011.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    38320444274716444799465753877248127062800272543896412285112766714339720482140634412119998541645722485903387948744704 := by
  change energy firstCenterIntegerGrade011 = _
  simp only [firstCenterIntegerGrade011, TaylorFirstIntegerGrade011Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade011Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade011Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade011Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
