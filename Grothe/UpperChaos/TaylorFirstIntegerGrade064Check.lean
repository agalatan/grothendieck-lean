import Grothe.UpperChaos.TaylorFirstIntegerGrade064Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade064Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade064Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade064Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade064Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade064Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade064Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade064Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade064Group007Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade064Group008Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade064Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade064.size = 4290 := by
  simp only [firstCenterIntegerGrade064, Array.size_append, TaylorFirstIntegerGrade064Group000Check.group_length, TaylorFirstIntegerGrade064Group001Check.group_length, TaylorFirstIntegerGrade064Group002Check.group_length, TaylorFirstIntegerGrade064Group003Check.group_length, TaylorFirstIntegerGrade064Group004Check.group_length, TaylorFirstIntegerGrade064Group005Check.group_length, TaylorFirstIntegerGrade064Group006Check.group_length, TaylorFirstIntegerGrade064Group007Check.group_length, TaylorFirstIntegerGrade064Group008Check.group_length]

theorem grade_energy : firstCenterIntegerGrade064.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    472300274026339123477449749354525172707375714453654142049834721194825363786851539161453915395650308506320833085440 := by
  change energy firstCenterIntegerGrade064 = _
  simp only [firstCenterIntegerGrade064, energy_append, TaylorFirstIntegerGrade064Group000Check.group_energy, TaylorFirstIntegerGrade064Group001Check.group_energy, TaylorFirstIntegerGrade064Group002Check.group_energy, TaylorFirstIntegerGrade064Group003Check.group_energy, TaylorFirstIntegerGrade064Group004Check.group_energy, TaylorFirstIntegerGrade064Group005Check.group_energy, TaylorFirstIntegerGrade064Group006Check.group_energy, TaylorFirstIntegerGrade064Group007Check.group_energy, TaylorFirstIntegerGrade064Group008Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade064Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade064Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade064Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
