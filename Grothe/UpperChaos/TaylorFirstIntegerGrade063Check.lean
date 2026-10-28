import Grothe.UpperChaos.TaylorFirstIntegerGrade063Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade063Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade063Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade063Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade063Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade063Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade063Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade063Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade063Group007Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade063Group008Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade063Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade063.size = 4160 := by
  simp only [firstCenterIntegerGrade063, Array.size_append, TaylorFirstIntegerGrade063Group000Check.group_length, TaylorFirstIntegerGrade063Group001Check.group_length, TaylorFirstIntegerGrade063Group002Check.group_length, TaylorFirstIntegerGrade063Group003Check.group_length, TaylorFirstIntegerGrade063Group004Check.group_length, TaylorFirstIntegerGrade063Group005Check.group_length, TaylorFirstIntegerGrade063Group006Check.group_length, TaylorFirstIntegerGrade063Group007Check.group_length, TaylorFirstIntegerGrade063Group008Check.group_length]

theorem grade_energy : firstCenterIntegerGrade063.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    555135529236491013726790834400688412103963554413770432764211777881630224824314591035953419987110033284990802853888 := by
  change energy firstCenterIntegerGrade063 = _
  simp only [firstCenterIntegerGrade063, energy_append, TaylorFirstIntegerGrade063Group000Check.group_energy, TaylorFirstIntegerGrade063Group001Check.group_energy, TaylorFirstIntegerGrade063Group002Check.group_energy, TaylorFirstIntegerGrade063Group003Check.group_energy, TaylorFirstIntegerGrade063Group004Check.group_energy, TaylorFirstIntegerGrade063Group005Check.group_energy, TaylorFirstIntegerGrade063Group006Check.group_energy, TaylorFirstIntegerGrade063Group007Check.group_energy, TaylorFirstIntegerGrade063Group008Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade063Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade063Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade063Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
