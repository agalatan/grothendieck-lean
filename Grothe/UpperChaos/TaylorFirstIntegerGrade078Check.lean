import Grothe.UpperChaos.TaylorFirstIntegerGrade078Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group007Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group008Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group009Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group010Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group011Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group012Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade078Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade078.size = 6320 := by
  simp only [firstCenterIntegerGrade078, Array.size_append, TaylorFirstIntegerGrade078Group000Check.group_length, TaylorFirstIntegerGrade078Group001Check.group_length, TaylorFirstIntegerGrade078Group002Check.group_length, TaylorFirstIntegerGrade078Group003Check.group_length, TaylorFirstIntegerGrade078Group004Check.group_length, TaylorFirstIntegerGrade078Group005Check.group_length, TaylorFirstIntegerGrade078Group006Check.group_length, TaylorFirstIntegerGrade078Group007Check.group_length, TaylorFirstIntegerGrade078Group008Check.group_length, TaylorFirstIntegerGrade078Group009Check.group_length, TaylorFirstIntegerGrade078Group010Check.group_length, TaylorFirstIntegerGrade078Group011Check.group_length, TaylorFirstIntegerGrade078Group012Check.group_length]

theorem grade_energy : firstCenterIntegerGrade078.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    65249581612383292356775200759355269168155372953154889529745447976073687245580244924417917452965658762763883773952 := by
  change energy firstCenterIntegerGrade078 = _
  simp only [firstCenterIntegerGrade078, energy_append, TaylorFirstIntegerGrade078Group000Check.group_energy, TaylorFirstIntegerGrade078Group001Check.group_energy, TaylorFirstIntegerGrade078Group002Check.group_energy, TaylorFirstIntegerGrade078Group003Check.group_energy, TaylorFirstIntegerGrade078Group004Check.group_energy, TaylorFirstIntegerGrade078Group005Check.group_energy, TaylorFirstIntegerGrade078Group006Check.group_energy, TaylorFirstIntegerGrade078Group007Check.group_energy, TaylorFirstIntegerGrade078Group008Check.group_energy, TaylorFirstIntegerGrade078Group009Check.group_energy, TaylorFirstIntegerGrade078Group010Check.group_energy, TaylorFirstIntegerGrade078Group011Check.group_energy, TaylorFirstIntegerGrade078Group012Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade078Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade078Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade078Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
