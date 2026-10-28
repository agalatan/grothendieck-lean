import Grothe.UpperChaos.TaylorFirstIntegerGrade034Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade034Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade034Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade034Group002Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade034Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade034.size = 1260 := by
  simp only [firstCenterIntegerGrade034, Array.size_append, TaylorFirstIntegerGrade034Group000Check.group_length, TaylorFirstIntegerGrade034Group001Check.group_length, TaylorFirstIntegerGrade034Group002Check.group_length]

theorem grade_energy : firstCenterIntegerGrade034.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    1898570301501744413062132916901018163023326061967516710355460173203628513191347380197467367544303911139806139121664 := by
  change energy firstCenterIntegerGrade034 = _
  simp only [firstCenterIntegerGrade034, energy_append, TaylorFirstIntegerGrade034Group000Check.group_energy, TaylorFirstIntegerGrade034Group001Check.group_energy, TaylorFirstIntegerGrade034Group002Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade034Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade034Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade034Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
