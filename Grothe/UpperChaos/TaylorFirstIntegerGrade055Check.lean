import Grothe.UpperChaos.TaylorFirstIntegerGrade055Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade055Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade055Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade055Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade055Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade055Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade055Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade055Group006Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade055Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade055.size = 3192 := by
  simp only [firstCenterIntegerGrade055, Array.size_append, TaylorFirstIntegerGrade055Group000Check.group_length, TaylorFirstIntegerGrade055Group001Check.group_length, TaylorFirstIntegerGrade055Group002Check.group_length, TaylorFirstIntegerGrade055Group003Check.group_length, TaylorFirstIntegerGrade055Group004Check.group_length, TaylorFirstIntegerGrade055Group005Check.group_length, TaylorFirstIntegerGrade055Group006Check.group_length]

theorem grade_energy : firstCenterIntegerGrade055.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    1197818246846894096839818599400338065787392846169388838014597942477291643714464034403517083519521903177434962853888 := by
  change energy firstCenterIntegerGrade055 = _
  simp only [firstCenterIntegerGrade055, energy_append, TaylorFirstIntegerGrade055Group000Check.group_energy, TaylorFirstIntegerGrade055Group001Check.group_energy, TaylorFirstIntegerGrade055Group002Check.group_energy, TaylorFirstIntegerGrade055Group003Check.group_energy, TaylorFirstIntegerGrade055Group004Check.group_energy, TaylorFirstIntegerGrade055Group005Check.group_energy, TaylorFirstIntegerGrade055Group006Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade055Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade055Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade055Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
