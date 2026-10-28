import Grothe.UpperChaos.TaylorSecondIntegerGrade026Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade026Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade026Group001Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade026Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade026.size = 756 := by
  simp only [secondCenterIntegerGrade026, Array.size_append, TaylorSecondIntegerGrade026Group000Check.group_length, TaylorSecondIntegerGrade026Group001Check.group_length]

theorem grade_energy : secondCenterIntegerGrade026.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    9795813296607863808391653792437036102137159463228429769463765864779426950279115281225222688618496757016238751744 := by
  change energy secondCenterIntegerGrade026 = _
  simp only [secondCenterIntegerGrade026, energy_append, TaylorSecondIntegerGrade026Group000Check.group_energy, TaylorSecondIntegerGrade026Group001Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade026Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade026Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade026Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
