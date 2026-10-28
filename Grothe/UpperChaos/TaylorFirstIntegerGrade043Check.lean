import Grothe.UpperChaos.TaylorFirstIntegerGrade043Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade043Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade043Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade043Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade043Group003Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade043Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade043.size = 1980 := by
  simp only [firstCenterIntegerGrade043, Array.size_append, TaylorFirstIntegerGrade043Group000Check.group_length, TaylorFirstIntegerGrade043Group001Check.group_length, TaylorFirstIntegerGrade043Group002Check.group_length, TaylorFirstIntegerGrade043Group003Check.group_length]

theorem grade_energy : firstCenterIntegerGrade043.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    4345894361482080129398149538650576111173838980313551897111980274786773589145644716535022551719295436185370777092096 := by
  change energy firstCenterIntegerGrade043 = _
  simp only [firstCenterIntegerGrade043, energy_append, TaylorFirstIntegerGrade043Group000Check.group_energy, TaylorFirstIntegerGrade043Group001Check.group_energy, TaylorFirstIntegerGrade043Group002Check.group_energy, TaylorFirstIntegerGrade043Group003Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade043Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade043Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade043Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
