import Grothe.UpperChaos.TaylorSecondIntegerGrade042Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade042Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade042Group001Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade042Group002Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade042Group003Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade042Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade042.size = 1892 := by
  simp only [secondCenterIntegerGrade042, Array.size_append, TaylorSecondIntegerGrade042Group000Check.group_length, TaylorSecondIntegerGrade042Group001Check.group_length, TaylorSecondIntegerGrade042Group002Check.group_length, TaylorSecondIntegerGrade042Group003Check.group_length]

theorem grade_energy : secondCenterIntegerGrade042.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    1831432911723014005521846387245707572017737070595831605729228692727088358131047576701134397130658422382869348352 := by
  change energy secondCenterIntegerGrade042 = _
  simp only [secondCenterIntegerGrade042, energy_append, TaylorSecondIntegerGrade042Group000Check.group_energy, TaylorSecondIntegerGrade042Group001Check.group_energy, TaylorSecondIntegerGrade042Group002Check.group_energy, TaylorSecondIntegerGrade042Group003Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade042Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade042Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade042Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
