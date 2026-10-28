import Grothe.UpperChaos.TaylorSecondIntegerGrade027Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade027Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade027Group001Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade027Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade027.size = 812 := by
  simp only [secondCenterIntegerGrade027, Array.size_append, TaylorSecondIntegerGrade027Group000Check.group_length, TaylorSecondIntegerGrade027Group001Check.group_length]

theorem grade_energy : secondCenterIntegerGrade027.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    9910331368175814647605332345586265908157942377765614855247895177943399590677725135284643277344314817558031106048 := by
  change energy secondCenterIntegerGrade027 = _
  simp only [secondCenterIntegerGrade027, energy_append, TaylorSecondIntegerGrade027Group000Check.group_energy, TaylorSecondIntegerGrade027Group001Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade027Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade027Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade027Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
