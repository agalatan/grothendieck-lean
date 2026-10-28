import Grothe.UpperChaos.TaylorSecondIntegerGrade033Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade033Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade033Group001Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade033Group002Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade033Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade033.size = 1190 := by
  simp only [secondCenterIntegerGrade033, Array.size_append, TaylorSecondIntegerGrade033Group000Check.group_length, TaylorSecondIntegerGrade033Group001Check.group_length, TaylorSecondIntegerGrade033Group002Check.group_length]

theorem grade_energy : secondCenterIntegerGrade033.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    6488284039827766536499035677813977662359536030859316252834675593323302969020605492177851498634062350593281753088 := by
  change energy secondCenterIntegerGrade033 = _
  simp only [secondCenterIntegerGrade033, energy_append, TaylorSecondIntegerGrade033Group000Check.group_energy, TaylorSecondIntegerGrade033Group001Check.group_energy, TaylorSecondIntegerGrade033Group002Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade033Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade033Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade033Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
