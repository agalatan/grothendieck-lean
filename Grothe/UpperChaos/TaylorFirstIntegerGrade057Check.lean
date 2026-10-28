import Grothe.UpperChaos.TaylorFirstIntegerGrade057Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade057Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade057Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade057Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade057Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade057Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade057Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade057Group006Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade057Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade057.size = 3422 := by
  simp only [firstCenterIntegerGrade057, Array.size_append, TaylorFirstIntegerGrade057Group000Check.group_length, TaylorFirstIntegerGrade057Group001Check.group_length, TaylorFirstIntegerGrade057Group002Check.group_length, TaylorFirstIntegerGrade057Group003Check.group_length, TaylorFirstIntegerGrade057Group004Check.group_length, TaylorFirstIntegerGrade057Group005Check.group_length, TaylorFirstIntegerGrade057Group006Check.group_length]

theorem grade_energy : firstCenterIntegerGrade057.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    1194495461999690792326217859462495237938686770800010652019547533410304722368637323427800324394751124864061440786432 := by
  change energy firstCenterIntegerGrade057 = _
  simp only [firstCenterIntegerGrade057, energy_append, TaylorFirstIntegerGrade057Group000Check.group_energy, TaylorFirstIntegerGrade057Group001Check.group_energy, TaylorFirstIntegerGrade057Group002Check.group_energy, TaylorFirstIntegerGrade057Group003Check.group_energy, TaylorFirstIntegerGrade057Group004Check.group_energy, TaylorFirstIntegerGrade057Group005Check.group_energy, TaylorFirstIntegerGrade057Group006Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade057Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade057Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade057Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
