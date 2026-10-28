import Grothe.UpperChaos.TaylorSecondIntegerGrade002Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade002Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade002Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade002.size = 12 := by
  simp only [secondCenterIntegerGrade002, TaylorSecondIntegerGrade002Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade002.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    1078128652397920453440498500246534606483183185271846620440464939376742097622867927717671607534082875655621233868800 := by
  change energy secondCenterIntegerGrade002 = _
  simp only [secondCenterIntegerGrade002, TaylorSecondIntegerGrade002Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade002Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade002Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
