import Grothe.UpperChaos.TaylorSecondIntegerGrade022Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade022Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade022Group001Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade022Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade022.size = 552 := by
  simp only [secondCenterIntegerGrade022, Array.size_append, TaylorSecondIntegerGrade022Group000Check.group_length, TaylorSecondIntegerGrade022Group001Check.group_length]

theorem grade_energy : secondCenterIntegerGrade022.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    19697951231078869038800660258353831833381080166894575804463327179542159142930011389015858452102429369795224797184 := by
  change energy secondCenterIntegerGrade022 = _
  simp only [secondCenterIntegerGrade022, energy_append, TaylorSecondIntegerGrade022Group000Check.group_energy, TaylorSecondIntegerGrade022Group001Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade022Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade022Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade022Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
