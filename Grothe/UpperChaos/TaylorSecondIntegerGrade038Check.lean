import Grothe.UpperChaos.TaylorSecondIntegerGrade038Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade038Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade038Group001Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade038Group002Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade038Group003Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade038Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade038.size = 1560 := by
  simp only [secondCenterIntegerGrade038, Array.size_append, TaylorSecondIntegerGrade038Group000Check.group_length, TaylorSecondIntegerGrade038Group001Check.group_length, TaylorSecondIntegerGrade038Group002Check.group_length, TaylorSecondIntegerGrade038Group003Check.group_length]

theorem grade_energy : secondCenterIntegerGrade038.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    3371594226881965227962923409832327618996976026990780824204865434620956590447416156874584179630265324873415917568 := by
  change energy secondCenterIntegerGrade038 = _
  simp only [secondCenterIntegerGrade038, energy_append, TaylorSecondIntegerGrade038Group000Check.group_energy, TaylorSecondIntegerGrade038Group001Check.group_energy, TaylorSecondIntegerGrade038Group002Check.group_energy, TaylorSecondIntegerGrade038Group003Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade038Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade038Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade038Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
