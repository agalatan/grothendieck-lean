import Grothe.UpperChaos.TaylorSecondIntegerGrade016Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade016Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade016Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade016.size = 306 := by
  simp only [secondCenterIntegerGrade016, TaylorSecondIntegerGrade016Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade016.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    39955657495444769788191931760294182853093897587313154550159649553304706955824185626330364380311100035331851812864 := by
  change energy secondCenterIntegerGrade016 = _
  simp only [secondCenterIntegerGrade016, TaylorSecondIntegerGrade016Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade016Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade016Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade016Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
