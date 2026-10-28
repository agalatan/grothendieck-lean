import Grothe.UpperChaos.TaylorFirstIntegerGrade012Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade012Group000Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade012Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade012.size = 182 := by
  simp only [firstCenterIntegerGrade012, TaylorFirstIntegerGrade012Group000Check.group_length]

theorem grade_energy : firstCenterIntegerGrade012.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    26943815466079732314757466658625972099248957270145247848670018998473106062092514085256670101287620134872935183679488 := by
  change energy firstCenterIntegerGrade012 = _
  simp only [firstCenterIntegerGrade012, TaylorFirstIntegerGrade012Group000Check.group_energy]

end Grothe.UpperChaos.TaylorFirstIntegerGrade012Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade012Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade012Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
