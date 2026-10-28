import Grothe.UpperChaos.TaylorSecondIntegerGrade043Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade043Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade043Group001Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade043Group002Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade043Group003Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade043Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade043.size = 1980 := by
  simp only [secondCenterIntegerGrade043, Array.size_append, TaylorSecondIntegerGrade043Group000Check.group_length, TaylorSecondIntegerGrade043Group001Check.group_length, TaylorSecondIntegerGrade043Group002Check.group_length, TaylorSecondIntegerGrade043Group003Check.group_length]

theorem grade_energy : secondCenterIntegerGrade043.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    2130513538597828729799151133844433966042343890305998271275640048971446192754674325231115756946711210566973652992 := by
  change energy secondCenterIntegerGrade043 = _
  simp only [secondCenterIntegerGrade043, energy_append, TaylorSecondIntegerGrade043Group000Check.group_energy, TaylorSecondIntegerGrade043Group001Check.group_energy, TaylorSecondIntegerGrade043Group002Check.group_energy, TaylorSecondIntegerGrade043Group003Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade043Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade043Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade043Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
