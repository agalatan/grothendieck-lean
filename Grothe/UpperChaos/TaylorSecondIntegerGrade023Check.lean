import Grothe.UpperChaos.TaylorSecondIntegerGrade023Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade023Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade023Group001Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade023Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade023.size = 600 := by
  simp only [secondCenterIntegerGrade023, Array.size_append, TaylorSecondIntegerGrade023Group000Check.group_length, TaylorSecondIntegerGrade023Group001Check.group_length]

theorem grade_energy : secondCenterIntegerGrade023.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    13682242404978229927728581436514689277890997176962001654268806434499282495375497844999663168559792196053689696256 := by
  change energy secondCenterIntegerGrade023 = _
  simp only [secondCenterIntegerGrade023, energy_append, TaylorSecondIntegerGrade023Group000Check.group_energy, TaylorSecondIntegerGrade023Group001Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade023Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade023Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade023Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
