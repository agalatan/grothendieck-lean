import Grothe.UpperChaos.TaylorFirstIntegerGrade061Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade061Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade061Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade061Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade061Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade061Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade061Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade061Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade061Group007Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade061Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade061.size = 3906 := by
  simp only [firstCenterIntegerGrade061, Array.size_append, TaylorFirstIntegerGrade061Group000Check.group_length, TaylorFirstIntegerGrade061Group001Check.group_length, TaylorFirstIntegerGrade061Group002Check.group_length, TaylorFirstIntegerGrade061Group003Check.group_length, TaylorFirstIntegerGrade061Group004Check.group_length, TaylorFirstIntegerGrade061Group005Check.group_length, TaylorFirstIntegerGrade061Group006Check.group_length, TaylorFirstIntegerGrade061Group007Check.group_length]

theorem grade_energy : firstCenterIntegerGrade061.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    772602063755472477575298010310999371776914124922411774843593222210540805365186817328299613181546082263935689424896 := by
  change energy firstCenterIntegerGrade061 = _
  simp only [firstCenterIntegerGrade061, energy_append, TaylorFirstIntegerGrade061Group000Check.group_energy, TaylorFirstIntegerGrade061Group001Check.group_energy, TaylorFirstIntegerGrade061Group002Check.group_energy, TaylorFirstIntegerGrade061Group003Check.group_energy, TaylorFirstIntegerGrade061Group004Check.group_energy, TaylorFirstIntegerGrade061Group005Check.group_energy, TaylorFirstIntegerGrade061Group006Check.group_energy, TaylorFirstIntegerGrade061Group007Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade061Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade061Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade061Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
