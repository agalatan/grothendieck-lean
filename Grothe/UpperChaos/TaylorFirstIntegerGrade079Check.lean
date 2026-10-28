import Grothe.UpperChaos.TaylorFirstIntegerGrade079Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group007Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group008Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group009Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group010Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group011Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group012Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade079Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade079.size = 6480 := by
  simp only [firstCenterIntegerGrade079, Array.size_append, TaylorFirstIntegerGrade079Group000Check.group_length, TaylorFirstIntegerGrade079Group001Check.group_length, TaylorFirstIntegerGrade079Group002Check.group_length, TaylorFirstIntegerGrade079Group003Check.group_length, TaylorFirstIntegerGrade079Group004Check.group_length, TaylorFirstIntegerGrade079Group005Check.group_length, TaylorFirstIntegerGrade079Group006Check.group_length, TaylorFirstIntegerGrade079Group007Check.group_length, TaylorFirstIntegerGrade079Group008Check.group_length, TaylorFirstIntegerGrade079Group009Check.group_length, TaylorFirstIntegerGrade079Group010Check.group_length, TaylorFirstIntegerGrade079Group011Check.group_length, TaylorFirstIntegerGrade079Group012Check.group_length]

theorem grade_energy : firstCenterIntegerGrade079.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    60272357370157468203543885659192708907613149638060121811593045384248755247301281934293231396392685361615194816512 := by
  change energy firstCenterIntegerGrade079 = _
  simp only [firstCenterIntegerGrade079, energy_append, TaylorFirstIntegerGrade079Group000Check.group_energy, TaylorFirstIntegerGrade079Group001Check.group_energy, TaylorFirstIntegerGrade079Group002Check.group_energy, TaylorFirstIntegerGrade079Group003Check.group_energy, TaylorFirstIntegerGrade079Group004Check.group_energy, TaylorFirstIntegerGrade079Group005Check.group_energy, TaylorFirstIntegerGrade079Group006Check.group_energy, TaylorFirstIntegerGrade079Group007Check.group_energy, TaylorFirstIntegerGrade079Group008Check.group_energy, TaylorFirstIntegerGrade079Group009Check.group_energy, TaylorFirstIntegerGrade079Group010Check.group_energy, TaylorFirstIntegerGrade079Group011Check.group_energy, TaylorFirstIntegerGrade079Group012Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade079Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade079Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade079Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
