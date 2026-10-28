import Grothe.UpperChaos.TaylorFirstIntegerGrade014Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade014Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade014Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade014.size = 240 := by
  simp only [firstCenterIntegerGrade014, TaylorFirstIntegerGrade014Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade014.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    19143588113311970875460852524488723228771705158716902438552609365950129004779692559116620091574316783473361762123776 := by
  change energy firstCenterIntegerGrade014 = _
  simp only [firstCenterIntegerGrade014, TaylorFirstIntegerGrade014Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade014Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade014Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade014Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
