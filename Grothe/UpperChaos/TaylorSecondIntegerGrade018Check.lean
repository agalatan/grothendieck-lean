import Grothe.UpperChaos.TaylorSecondIntegerGrade018Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade018Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade018Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade018.size = 380 := by
  simp only [secondCenterIntegerGrade018, TaylorSecondIntegerGrade018Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade018.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    46446478661809863476741132392064421556255960968312924402309500828001328793242409108869375131018846354409563095040 := by
  change energy secondCenterIntegerGrade018 = _
  simp only [secondCenterIntegerGrade018, TaylorSecondIntegerGrade018Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade018Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade018Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade018Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
