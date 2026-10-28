import Grothe.UpperChaos.TaylorFirstIntegerGrade025Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade025Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade025Group001Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade025Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade025.size = 702 := by
  simp only [firstCenterIntegerGrade025, Array.size_append, TaylorFirstIntegerGrade025Group000Check.group_length, TaylorFirstIntegerGrade025Group001Check.group_length]

theorem grade_energy : firstCenterIntegerGrade025.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    4430466267724737854181292804639723420398017347460178270675247562097317623150052980150671680433174509060231794786304 := by
  change energy firstCenterIntegerGrade025 = _
  simp only [firstCenterIntegerGrade025, energy_append, TaylorFirstIntegerGrade025Group000Check.group_energy, TaylorFirstIntegerGrade025Group001Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade025Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade025Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade025Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
