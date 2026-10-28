import Grothe.UpperChaos.TaylorFirstIntegerGrade054Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade054Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade054Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade054Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade054Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade054Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade054Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade054Group006Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade054Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade054.size = 3080 := by
  simp only [firstCenterIntegerGrade054, Array.size_append, TaylorFirstIntegerGrade054Group000Check.group_length, TaylorFirstIntegerGrade054Group001Check.group_length, TaylorFirstIntegerGrade054Group002Check.group_length, TaylorFirstIntegerGrade054Group003Check.group_length, TaylorFirstIntegerGrade054Group004Check.group_length, TaylorFirstIntegerGrade054Group005Check.group_length, TaylorFirstIntegerGrade054Group006Check.group_length]

theorem grade_energy : firstCenterIntegerGrade054.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    1151648136763281576469938571790911360961705000717499004571864732001310063228798649077590428025528651603356525002752 := by
  change energy firstCenterIntegerGrade054 = _
  simp only [firstCenterIntegerGrade054, energy_append, TaylorFirstIntegerGrade054Group000Check.group_energy, TaylorFirstIntegerGrade054Group001Check.group_energy, TaylorFirstIntegerGrade054Group002Check.group_energy, TaylorFirstIntegerGrade054Group003Check.group_energy, TaylorFirstIntegerGrade054Group004Check.group_energy, TaylorFirstIntegerGrade054Group005Check.group_energy, TaylorFirstIntegerGrade054Group006Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade054Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade054Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade054Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
