import Grothe.UpperChaos.TaylorSecondIntegerGrade003Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade003Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade003Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade003.size = 20 := by
  simp only [secondCenterIntegerGrade003, TaylorSecondIntegerGrade003Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade003.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    1100165202386148327378430294547552660209207074630812594564882219328913502996520625052712471958922712991958264971264 := by
  change energy secondCenterIntegerGrade003 = _
  simp only [secondCenterIntegerGrade003, TaylorSecondIntegerGrade003Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade003Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade003Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
