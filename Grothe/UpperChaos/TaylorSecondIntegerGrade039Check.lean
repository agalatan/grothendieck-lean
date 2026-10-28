import Grothe.UpperChaos.TaylorSecondIntegerGrade039Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade039Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade039Group001Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade039Group002Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade039Group003Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade039Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade039.size = 1640 := by
  simp only [secondCenterIntegerGrade039, Array.size_append, TaylorSecondIntegerGrade039Group000Check.group_length, TaylorSecondIntegerGrade039Group001Check.group_length, TaylorSecondIntegerGrade039Group002Check.group_length, TaylorSecondIntegerGrade039Group003Check.group_length]

theorem grade_energy : secondCenterIntegerGrade039.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    3747498737020045549100086063593777797637724236145477277316738300140295542484652718731644022292924006108378431488 := by
  change energy secondCenterIntegerGrade039 = _
  simp only [secondCenterIntegerGrade039, energy_append, TaylorSecondIntegerGrade039Group000Check.group_energy, TaylorSecondIntegerGrade039Group001Check.group_energy, TaylorSecondIntegerGrade039Group002Check.group_energy, TaylorSecondIntegerGrade039Group003Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade039Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade039Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade039Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
