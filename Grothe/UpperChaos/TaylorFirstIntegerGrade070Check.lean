import Grothe.UpperChaos.TaylorFirstIntegerGrade070Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade070Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade070Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade070Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade070Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade070Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade070Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade070Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade070Group007Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade070Group008Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade070Group009Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade070Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade070.size = 5112 := by
  simp only [firstCenterIntegerGrade070, Array.size_append, TaylorFirstIntegerGrade070Group000Check.group_length, TaylorFirstIntegerGrade070Group001Check.group_length, TaylorFirstIntegerGrade070Group002Check.group_length, TaylorFirstIntegerGrade070Group003Check.group_length, TaylorFirstIntegerGrade070Group004Check.group_length, TaylorFirstIntegerGrade070Group005Check.group_length, TaylorFirstIntegerGrade070Group006Check.group_length, TaylorFirstIntegerGrade070Group007Check.group_length, TaylorFirstIntegerGrade070Group008Check.group_length, TaylorFirstIntegerGrade070Group009Check.group_length]

theorem grade_energy : firstCenterIntegerGrade070.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    186170024178931991485156933420831475473217255000126935299476185244238151015474692202812695450729547899050267770880 := by
  change energy firstCenterIntegerGrade070 = _
  simp only [firstCenterIntegerGrade070, energy_append, TaylorFirstIntegerGrade070Group000Check.group_energy, TaylorFirstIntegerGrade070Group001Check.group_energy, TaylorFirstIntegerGrade070Group002Check.group_energy, TaylorFirstIntegerGrade070Group003Check.group_energy, TaylorFirstIntegerGrade070Group004Check.group_energy, TaylorFirstIntegerGrade070Group005Check.group_energy, TaylorFirstIntegerGrade070Group006Check.group_energy, TaylorFirstIntegerGrade070Group007Check.group_energy, TaylorFirstIntegerGrade070Group008Check.group_energy, TaylorFirstIntegerGrade070Group009Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade070Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade070Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade070Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
