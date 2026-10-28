import Grothe.UpperChaos.TaylorFirstIntegerGrade072Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group007Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group008Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group009Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group010Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade072Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade072.size = 5402 := by
  simp only [firstCenterIntegerGrade072, Array.size_append, TaylorFirstIntegerGrade072Group000Check.group_length, TaylorFirstIntegerGrade072Group001Check.group_length, TaylorFirstIntegerGrade072Group002Check.group_length, TaylorFirstIntegerGrade072Group003Check.group_length, TaylorFirstIntegerGrade072Group004Check.group_length, TaylorFirstIntegerGrade072Group005Check.group_length, TaylorFirstIntegerGrade072Group006Check.group_length, TaylorFirstIntegerGrade072Group007Check.group_length, TaylorFirstIntegerGrade072Group008Check.group_length, TaylorFirstIntegerGrade072Group009Check.group_length, TaylorFirstIntegerGrade072Group010Check.group_length]

theorem grade_energy : firstCenterIntegerGrade072.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    129721273234122303648248148343809745970973289402514140307178576369628687243038617173400272730938483760458937401344 := by
  change energy firstCenterIntegerGrade072 = _
  simp only [firstCenterIntegerGrade072, energy_append, TaylorFirstIntegerGrade072Group000Check.group_energy, TaylorFirstIntegerGrade072Group001Check.group_energy, TaylorFirstIntegerGrade072Group002Check.group_energy, TaylorFirstIntegerGrade072Group003Check.group_energy, TaylorFirstIntegerGrade072Group004Check.group_energy, TaylorFirstIntegerGrade072Group005Check.group_energy, TaylorFirstIntegerGrade072Group006Check.group_energy, TaylorFirstIntegerGrade072Group007Check.group_energy, TaylorFirstIntegerGrade072Group008Check.group_energy, TaylorFirstIntegerGrade072Group009Check.group_energy, TaylorFirstIntegerGrade072Group010Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade072Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade072Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade072Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
