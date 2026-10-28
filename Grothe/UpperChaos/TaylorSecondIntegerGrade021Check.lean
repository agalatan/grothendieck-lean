import Grothe.UpperChaos.TaylorSecondIntegerGrade021Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade021Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade021Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade021.size = 506 := by
  simp only [secondCenterIntegerGrade021, TaylorSecondIntegerGrade021Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade021.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    23700622513523482425527253089180220214358574004745275346220809391569892462048750549387287680102635596552800829440 := by
  change energy secondCenterIntegerGrade021 = _
  simp only [secondCenterIntegerGrade021, TaylorSecondIntegerGrade021Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade021Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade021Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade021Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
