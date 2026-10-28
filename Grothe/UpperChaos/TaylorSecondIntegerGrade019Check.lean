import Grothe.UpperChaos.TaylorSecondIntegerGrade019Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade019Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade019Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade019.size = 420 := by
  simp only [secondCenterIntegerGrade019, TaylorSecondIntegerGrade019Group000Check.group_length]

theorem grade_energy : secondCenterIntegerGrade019.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    28526940505067831410321355379188855907036040265019761198171547418543347171260805210740873595070437818076864970752 := by
  change energy secondCenterIntegerGrade019 = _
  simp only [secondCenterIntegerGrade019, TaylorSecondIntegerGrade019Group000Check.group_energy]

end Grothe.UpperChaos.TaylorSecondIntegerGrade019Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade019Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade019Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
