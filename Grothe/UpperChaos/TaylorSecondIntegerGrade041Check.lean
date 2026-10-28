import Grothe.UpperChaos.TaylorSecondIntegerGrade041Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade041Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade041Group001Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade041Group002Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade041Group003Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade041Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade041.size = 1806 := by
  simp only [secondCenterIntegerGrade041, Array.size_append, TaylorSecondIntegerGrade041Group000Check.group_length, TaylorSecondIntegerGrade041Group001Check.group_length, TaylorSecondIntegerGrade041Group002Check.group_length, TaylorSecondIntegerGrade041Group003Check.group_length]

theorem grade_energy : secondCenterIntegerGrade041.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    2744796759663031863186189047179612318559739526218498116909533084957166837378805145611369292939319618358141255680 := by
  change energy secondCenterIntegerGrade041 = _
  simp only [secondCenterIntegerGrade041, energy_append, TaylorSecondIntegerGrade041Group000Check.group_energy, TaylorSecondIntegerGrade041Group001Check.group_energy, TaylorSecondIntegerGrade041Group002Check.group_energy, TaylorSecondIntegerGrade041Group003Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade041Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade041Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade041Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
