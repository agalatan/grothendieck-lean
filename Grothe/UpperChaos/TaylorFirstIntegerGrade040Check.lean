import Grothe.UpperChaos.TaylorFirstIntegerGrade040Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade040Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade040Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade040Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade040Group003Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade040Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade040.size = 1722 := by
  simp only [firstCenterIntegerGrade040, Array.size_append, TaylorFirstIntegerGrade040Group000Check.group_length, TaylorFirstIntegerGrade040Group001Check.group_length, TaylorFirstIntegerGrade040Group002Check.group_length, TaylorFirstIntegerGrade040Group003Check.group_length]

theorem grade_energy : firstCenterIntegerGrade040.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    1640038111056484147440328129240110322882602943801087523409972121464422231936975496115375769678290132449221729583104 := by
  change energy firstCenterIntegerGrade040 = _
  simp only [firstCenterIntegerGrade040, energy_append, TaylorFirstIntegerGrade040Group000Check.group_energy, TaylorFirstIntegerGrade040Group001Check.group_energy, TaylorFirstIntegerGrade040Group002Check.group_energy, TaylorFirstIntegerGrade040Group003Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade040Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade040Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade040Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
