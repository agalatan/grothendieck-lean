import Grothe.UpperChaos.TaylorFirstIntegerGrade066Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade066Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade066Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade066Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade066Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade066Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade066Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade066Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade066Group007Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade066Group008Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade066Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade066.size = 4556 := by
  simp only [firstCenterIntegerGrade066, Array.size_append, TaylorFirstIntegerGrade066Group000Check.group_length, TaylorFirstIntegerGrade066Group001Check.group_length, TaylorFirstIntegerGrade066Group002Check.group_length, TaylorFirstIntegerGrade066Group003Check.group_length, TaylorFirstIntegerGrade066Group004Check.group_length, TaylorFirstIntegerGrade066Group005Check.group_length, TaylorFirstIntegerGrade066Group006Check.group_length, TaylorFirstIntegerGrade066Group007Check.group_length, TaylorFirstIntegerGrade066Group008Check.group_length]

theorem grade_energy : firstCenterIntegerGrade066.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    350326081131060092890614911129762684127437910818257863803615238521872174404849425603630289139373044186317682900992 := by
  change energy firstCenterIntegerGrade066 = _
  simp only [firstCenterIntegerGrade066, energy_append, TaylorFirstIntegerGrade066Group000Check.group_energy, TaylorFirstIntegerGrade066Group001Check.group_energy, TaylorFirstIntegerGrade066Group002Check.group_energy, TaylorFirstIntegerGrade066Group003Check.group_energy, TaylorFirstIntegerGrade066Group004Check.group_energy, TaylorFirstIntegerGrade066Group005Check.group_energy, TaylorFirstIntegerGrade066Group006Check.group_energy, TaylorFirstIntegerGrade066Group007Check.group_energy, TaylorFirstIntegerGrade066Group008Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade066Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade066Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade066Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
