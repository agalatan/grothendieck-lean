import Grothe.UpperChaos.TaylorFirstIntegerGrade083Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group007Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group008Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group009Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group010Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group011Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group012Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group013Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade083Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade083.size = 7140 := by
  simp only [firstCenterIntegerGrade083, Array.size_append, TaylorFirstIntegerGrade083Group000Check.group_length, TaylorFirstIntegerGrade083Group001Check.group_length, TaylorFirstIntegerGrade083Group002Check.group_length, TaylorFirstIntegerGrade083Group003Check.group_length, TaylorFirstIntegerGrade083Group004Check.group_length, TaylorFirstIntegerGrade083Group005Check.group_length, TaylorFirstIntegerGrade083Group006Check.group_length, TaylorFirstIntegerGrade083Group007Check.group_length, TaylorFirstIntegerGrade083Group008Check.group_length, TaylorFirstIntegerGrade083Group009Check.group_length, TaylorFirstIntegerGrade083Group010Check.group_length, TaylorFirstIntegerGrade083Group011Check.group_length, TaylorFirstIntegerGrade083Group012Check.group_length, TaylorFirstIntegerGrade083Group013Check.group_length]

theorem grade_energy : firstCenterIntegerGrade083.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    37910956963976415558242124558182198580004832697526616046768604476610180528806191558082111535759310977983628443648 := by
  change energy firstCenterIntegerGrade083 = _
  simp only [firstCenterIntegerGrade083, energy_append, TaylorFirstIntegerGrade083Group000Check.group_energy, TaylorFirstIntegerGrade083Group001Check.group_energy, TaylorFirstIntegerGrade083Group002Check.group_energy, TaylorFirstIntegerGrade083Group003Check.group_energy, TaylorFirstIntegerGrade083Group004Check.group_energy, TaylorFirstIntegerGrade083Group005Check.group_energy, TaylorFirstIntegerGrade083Group006Check.group_energy, TaylorFirstIntegerGrade083Group007Check.group_energy, TaylorFirstIntegerGrade083Group008Check.group_energy, TaylorFirstIntegerGrade083Group009Check.group_energy, TaylorFirstIntegerGrade083Group010Check.group_energy, TaylorFirstIntegerGrade083Group011Check.group_energy, TaylorFirstIntegerGrade083Group012Check.group_energy, TaylorFirstIntegerGrade083Group013Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade083Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade083Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade083Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
