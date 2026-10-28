import Grothe.UpperChaos.TaylorSecondIntegerGrade030Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade030Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade030Group001Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade030Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade030.size = 992 := by
  simp only [secondCenterIntegerGrade030, Array.size_append, TaylorSecondIntegerGrade030Group000Check.group_length, TaylorSecondIntegerGrade030Group001Check.group_length]

theorem grade_energy : secondCenterIntegerGrade030.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    6429330213681052984265884285741320112732888951397234618994038461057708159877845529735072142672022868276287635456 := by
  change energy secondCenterIntegerGrade030 = _
  simp only [secondCenterIntegerGrade030, energy_append, TaylorSecondIntegerGrade030Group000Check.group_energy, TaylorSecondIntegerGrade030Group001Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade030Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade030Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade030Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
