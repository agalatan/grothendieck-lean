import Grothe.UpperChaos.TaylorFirstIntegerGrade053Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade053Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade053Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade053Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade053Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade053Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade053Group005Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade053Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade053.size = 2970 := by
  simp only [firstCenterIntegerGrade053, Array.size_append, TaylorFirstIntegerGrade053Group000Check.group_length, TaylorFirstIntegerGrade053Group001Check.group_length, TaylorFirstIntegerGrade053Group002Check.group_length, TaylorFirstIntegerGrade053Group003Check.group_length, TaylorFirstIntegerGrade053Group004Check.group_length, TaylorFirstIntegerGrade053Group005Check.group_length]

theorem grade_energy : firstCenterIntegerGrade053.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    1106044430930429026669119139438425322673367370619843471927619583161817356819935430446592497884087591004713277980672 := by
  change energy firstCenterIntegerGrade053 = _
  simp only [firstCenterIntegerGrade053, energy_append, TaylorFirstIntegerGrade053Group000Check.group_energy, TaylorFirstIntegerGrade053Group001Check.group_energy, TaylorFirstIntegerGrade053Group002Check.group_energy, TaylorFirstIntegerGrade053Group003Check.group_energy, TaylorFirstIntegerGrade053Group004Check.group_energy, TaylorFirstIntegerGrade053Group005Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade053Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade053Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade053Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
