import Grothe.UpperChaos.TaylorSecondIntegerGrade029Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade029Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade029Group001Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade029Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade029.size = 930 := by
  simp only [secondCenterIntegerGrade029, Array.size_append, TaylorSecondIntegerGrade029Group000Check.group_length, TaylorSecondIntegerGrade029Group001Check.group_length]

theorem grade_energy : secondCenterIntegerGrade029.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    8591939525048415722527474270515074635452843989920389252852036728305509035980067987363399502051005296302184464384 := by
  change energy secondCenterIntegerGrade029 = _
  simp only [secondCenterIntegerGrade029, energy_append, TaylorSecondIntegerGrade029Group000Check.group_energy, TaylorSecondIntegerGrade029Group001Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade029Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade029Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade029Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
