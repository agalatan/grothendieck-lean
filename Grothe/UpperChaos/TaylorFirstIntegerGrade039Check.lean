import Grothe.UpperChaos.TaylorFirstIntegerGrade039Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade039Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade039Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade039Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade039Group003Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade039Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade039.size = 1640 := by
  simp only [firstCenterIntegerGrade039, Array.size_append, TaylorFirstIntegerGrade039Group000Check.group_length, TaylorFirstIntegerGrade039Group001Check.group_length, TaylorFirstIntegerGrade039Group002Check.group_length, TaylorFirstIntegerGrade039Group003Check.group_length]

theorem grade_energy : firstCenterIntegerGrade039.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    1325250450231873273006515597866509951857555792625447626667050490959664974840818048880759280472201370240093043818496 := by
  change energy firstCenterIntegerGrade039 = _
  simp only [firstCenterIntegerGrade039, energy_append, TaylorFirstIntegerGrade039Group000Check.group_energy, TaylorFirstIntegerGrade039Group001Check.group_energy, TaylorFirstIntegerGrade039Group002Check.group_energy, TaylorFirstIntegerGrade039Group003Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade039Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade039Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade039Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
