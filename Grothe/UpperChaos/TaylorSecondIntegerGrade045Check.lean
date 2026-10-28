import Grothe.UpperChaos.TaylorSecondIntegerGrade045Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade045Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade045Group001Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade045Group002Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade045Group003Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade045Group004Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade045Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade045.size = 2162 := by
  simp only [secondCenterIntegerGrade045, Array.size_append, TaylorSecondIntegerGrade045Group000Check.group_length, TaylorSecondIntegerGrade045Group001Check.group_length, TaylorSecondIntegerGrade045Group002Check.group_length, TaylorSecondIntegerGrade045Group003Check.group_length, TaylorSecondIntegerGrade045Group004Check.group_length]

theorem grade_energy : secondCenterIntegerGrade045.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    1860109620876631781773568890742516871523592939807890104779163683765922377839166649930554426795907182894486913024 := by
  change energy secondCenterIntegerGrade045 = _
  simp only [secondCenterIntegerGrade045, energy_append, TaylorSecondIntegerGrade045Group000Check.group_energy, TaylorSecondIntegerGrade045Group001Check.group_energy, TaylorSecondIntegerGrade045Group002Check.group_energy, TaylorSecondIntegerGrade045Group003Check.group_energy, TaylorSecondIntegerGrade045Group004Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade045Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade045Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade045Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
