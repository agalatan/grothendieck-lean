import Grothe.UpperChaos.TaylorFirstIntegerGrade069Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade069Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade069Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade069Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade069Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade069Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade069Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade069Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade069Group007Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade069Group008Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade069Group009Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade069Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade069.size = 4970 := by
  simp only [firstCenterIntegerGrade069, Array.size_append, TaylorFirstIntegerGrade069Group000Check.group_length, TaylorFirstIntegerGrade069Group001Check.group_length, TaylorFirstIntegerGrade069Group002Check.group_length, TaylorFirstIntegerGrade069Group003Check.group_length, TaylorFirstIntegerGrade069Group004Check.group_length, TaylorFirstIntegerGrade069Group005Check.group_length, TaylorFirstIntegerGrade069Group006Check.group_length, TaylorFirstIntegerGrade069Group007Check.group_length, TaylorFirstIntegerGrade069Group008Check.group_length, TaylorFirstIntegerGrade069Group009Check.group_length]

theorem grade_energy : firstCenterIntegerGrade069.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    221636204043169254883882824876493500166665604237974819604714901818437586226535996181478894009102924865122647146496 := by
  change energy firstCenterIntegerGrade069 = _
  simp only [firstCenterIntegerGrade069, energy_append, TaylorFirstIntegerGrade069Group000Check.group_energy, TaylorFirstIntegerGrade069Group001Check.group_energy, TaylorFirstIntegerGrade069Group002Check.group_energy, TaylorFirstIntegerGrade069Group003Check.group_energy, TaylorFirstIntegerGrade069Group004Check.group_energy, TaylorFirstIntegerGrade069Group005Check.group_energy, TaylorFirstIntegerGrade069Group006Check.group_energy, TaylorFirstIntegerGrade069Group007Check.group_energy, TaylorFirstIntegerGrade069Group008Check.group_energy, TaylorFirstIntegerGrade069Group009Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade069Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade069Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade069Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
