import Grothe.UpperChaos.TaylorFirstIntegerGrade073Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group007Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group008Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group009Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group010Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade073Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade073.size = 5550 := by
  simp only [firstCenterIntegerGrade073, Array.size_append, TaylorFirstIntegerGrade073Group000Check.group_length, TaylorFirstIntegerGrade073Group001Check.group_length, TaylorFirstIntegerGrade073Group002Check.group_length, TaylorFirstIntegerGrade073Group003Check.group_length, TaylorFirstIntegerGrade073Group004Check.group_length, TaylorFirstIntegerGrade073Group005Check.group_length, TaylorFirstIntegerGrade073Group006Check.group_length, TaylorFirstIntegerGrade073Group007Check.group_length, TaylorFirstIntegerGrade073Group008Check.group_length, TaylorFirstIntegerGrade073Group009Check.group_length, TaylorFirstIntegerGrade073Group010Check.group_length]

theorem grade_energy : firstCenterIntegerGrade073.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    109645941022640284553582261603441864729496341109581398077065534083817205484206196307618453103614336343386833813504 := by
  change energy firstCenterIntegerGrade073 = _
  simp only [firstCenterIntegerGrade073, energy_append, TaylorFirstIntegerGrade073Group000Check.group_energy, TaylorFirstIntegerGrade073Group001Check.group_energy, TaylorFirstIntegerGrade073Group002Check.group_energy, TaylorFirstIntegerGrade073Group003Check.group_energy, TaylorFirstIntegerGrade073Group004Check.group_energy, TaylorFirstIntegerGrade073Group005Check.group_energy, TaylorFirstIntegerGrade073Group006Check.group_energy, TaylorFirstIntegerGrade073Group007Check.group_energy, TaylorFirstIntegerGrade073Group008Check.group_energy, TaylorFirstIntegerGrade073Group009Check.group_energy, TaylorFirstIntegerGrade073Group010Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade073Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade073Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade073Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
