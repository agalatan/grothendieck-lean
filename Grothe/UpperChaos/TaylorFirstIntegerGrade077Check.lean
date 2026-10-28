import Grothe.UpperChaos.TaylorFirstIntegerGrade077Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group007Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group008Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group009Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group010Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group011Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group012Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade077Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade077.size = 6162 := by
  simp only [firstCenterIntegerGrade077, Array.size_append, TaylorFirstIntegerGrade077Group000Check.group_length, TaylorFirstIntegerGrade077Group001Check.group_length, TaylorFirstIntegerGrade077Group002Check.group_length, TaylorFirstIntegerGrade077Group003Check.group_length, TaylorFirstIntegerGrade077Group004Check.group_length, TaylorFirstIntegerGrade077Group005Check.group_length, TaylorFirstIntegerGrade077Group006Check.group_length, TaylorFirstIntegerGrade077Group007Check.group_length, TaylorFirstIntegerGrade077Group008Check.group_length, TaylorFirstIntegerGrade077Group009Check.group_length, TaylorFirstIntegerGrade077Group010Check.group_length, TaylorFirstIntegerGrade077Group011Check.group_length, TaylorFirstIntegerGrade077Group012Check.group_length]

theorem grade_energy : firstCenterIntegerGrade077.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    70194992779894910438279150303992322250317986371887767473038747335826127016025882102823361111930538443278024441856 := by
  change energy firstCenterIntegerGrade077 = _
  simp only [firstCenterIntegerGrade077, energy_append, TaylorFirstIntegerGrade077Group000Check.group_energy, TaylorFirstIntegerGrade077Group001Check.group_energy, TaylorFirstIntegerGrade077Group002Check.group_energy, TaylorFirstIntegerGrade077Group003Check.group_energy, TaylorFirstIntegerGrade077Group004Check.group_energy, TaylorFirstIntegerGrade077Group005Check.group_energy, TaylorFirstIntegerGrade077Group006Check.group_energy, TaylorFirstIntegerGrade077Group007Check.group_energy, TaylorFirstIntegerGrade077Group008Check.group_energy, TaylorFirstIntegerGrade077Group009Check.group_energy, TaylorFirstIntegerGrade077Group010Check.group_energy, TaylorFirstIntegerGrade077Group011Check.group_energy, TaylorFirstIntegerGrade077Group012Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade077Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade077Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade077Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
