import Grothe.UpperChaos.TaylorFirstIntegerGrade042Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade042Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade042Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade042Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade042Group003Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade042Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade042.size = 1892 := by
  simp only [firstCenterIntegerGrade042, Array.size_append, TaylorFirstIntegerGrade042Group000Check.group_length, TaylorFirstIntegerGrade042Group001Check.group_length, TaylorFirstIntegerGrade042Group002Check.group_length, TaylorFirstIntegerGrade042Group003Check.group_length]

theorem grade_energy : firstCenterIntegerGrade042.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    3493345952627067549370455610138682053913335093829408073452708437305790643918375365837895228578986019658326897328128 := by
  change energy firstCenterIntegerGrade042 = _
  simp only [firstCenterIntegerGrade042, energy_append, TaylorFirstIntegerGrade042Group000Check.group_energy, TaylorFirstIntegerGrade042Group001Check.group_energy, TaylorFirstIntegerGrade042Group002Check.group_energy, TaylorFirstIntegerGrade042Group003Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade042Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade042Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade042Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
