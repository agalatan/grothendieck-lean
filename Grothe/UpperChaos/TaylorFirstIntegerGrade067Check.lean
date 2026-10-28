import Grothe.UpperChaos.TaylorFirstIntegerGrade067Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade067Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade067Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade067Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade067Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade067Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade067Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade067Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade067Group007Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade067Group008Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade067Group009Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade067Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade067.size = 4692 := by
  simp only [firstCenterIntegerGrade067, Array.size_append, TaylorFirstIntegerGrade067Group000Check.group_length, TaylorFirstIntegerGrade067Group001Check.group_length, TaylorFirstIntegerGrade067Group002Check.group_length, TaylorFirstIntegerGrade067Group003Check.group_length, TaylorFirstIntegerGrade067Group004Check.group_length, TaylorFirstIntegerGrade067Group005Check.group_length, TaylorFirstIntegerGrade067Group006Check.group_length, TaylorFirstIntegerGrade067Group007Check.group_length, TaylorFirstIntegerGrade067Group008Check.group_length, TaylorFirstIntegerGrade067Group009Check.group_length]

theorem grade_energy : firstCenterIntegerGrade067.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    303168226196112063672165771067858074034224901552283818408224469434364686284977202318712124259367617415172700766208 := by
  change energy firstCenterIntegerGrade067 = _
  simp only [firstCenterIntegerGrade067, energy_append, TaylorFirstIntegerGrade067Group000Check.group_energy, TaylorFirstIntegerGrade067Group001Check.group_energy, TaylorFirstIntegerGrade067Group002Check.group_energy, TaylorFirstIntegerGrade067Group003Check.group_energy, TaylorFirstIntegerGrade067Group004Check.group_energy, TaylorFirstIntegerGrade067Group005Check.group_energy, TaylorFirstIntegerGrade067Group006Check.group_energy, TaylorFirstIntegerGrade067Group007Check.group_energy, TaylorFirstIntegerGrade067Group008Check.group_energy, TaylorFirstIntegerGrade067Group009Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade067Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade067Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade067Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
