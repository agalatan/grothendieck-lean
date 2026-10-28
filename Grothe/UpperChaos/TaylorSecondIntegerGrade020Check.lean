import Grothe.UpperChaos.TaylorSecondIntegerGrade020Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade020Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade020Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade020.size = 462 := by
  simp only [secondCenterIntegerGrade020, TaylorSecondIntegerGrade020Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade020.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    19066391682799252142817868584148952902931405974679166924047242369522461470236843010294753910381443034488032460800 := by
  change energy secondCenterIntegerGrade020 = _
  simp only [secondCenterIntegerGrade020, TaylorSecondIntegerGrade020Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade020Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade020Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade020Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
