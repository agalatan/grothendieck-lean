import Grothe.UpperChaos.TaylorSecondIntegerGrade032Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade032Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade032Group001Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade032Group002Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade032Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade032.size = 1122 := by
  simp only [secondCenterIntegerGrade032, Array.size_append, TaylorSecondIntegerGrade032Group000Check.group_length, TaylorSecondIntegerGrade032Group001Check.group_length, TaylorSecondIntegerGrade032Group002Check.group_length]

theorem grade_energy : secondCenterIntegerGrade032.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    8841555323790636386004053966583081952650535649288978237812182007834006548521970488718759732062288700262171279360 := by
  change energy secondCenterIntegerGrade032 = _
  simp only [secondCenterIntegerGrade032, energy_append, TaylorSecondIntegerGrade032Group000Check.group_energy, TaylorSecondIntegerGrade032Group001Check.group_energy, TaylorSecondIntegerGrade032Group002Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade032Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade032Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade032Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
