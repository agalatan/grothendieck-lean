import Grothe.UpperChaos.TaylorFirstIntegerGrade080Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group007Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group008Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group009Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group010Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group011Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group012Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade080Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade080.size = 6642 := by
  simp only [firstCenterIntegerGrade080, Array.size_append, TaylorFirstIntegerGrade080Group000Check.group_length, TaylorFirstIntegerGrade080Group001Check.group_length, TaylorFirstIntegerGrade080Group002Check.group_length, TaylorFirstIntegerGrade080Group003Check.group_length, TaylorFirstIntegerGrade080Group004Check.group_length, TaylorFirstIntegerGrade080Group005Check.group_length, TaylorFirstIntegerGrade080Group006Check.group_length, TaylorFirstIntegerGrade080Group007Check.group_length, TaylorFirstIntegerGrade080Group008Check.group_length, TaylorFirstIntegerGrade080Group009Check.group_length, TaylorFirstIntegerGrade080Group010Check.group_length, TaylorFirstIntegerGrade080Group011Check.group_length, TaylorFirstIntegerGrade080Group012Check.group_length]

theorem grade_energy : firstCenterIntegerGrade080.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    54852276925620284491200227673348887711578361824655257389216266021465956657964683203597238839822768973712522739712 := by
  change energy firstCenterIntegerGrade080 = _
  simp only [firstCenterIntegerGrade080, energy_append, TaylorFirstIntegerGrade080Group000Check.group_energy, TaylorFirstIntegerGrade080Group001Check.group_energy, TaylorFirstIntegerGrade080Group002Check.group_energy, TaylorFirstIntegerGrade080Group003Check.group_energy, TaylorFirstIntegerGrade080Group004Check.group_energy, TaylorFirstIntegerGrade080Group005Check.group_energy, TaylorFirstIntegerGrade080Group006Check.group_energy, TaylorFirstIntegerGrade080Group007Check.group_energy, TaylorFirstIntegerGrade080Group008Check.group_energy, TaylorFirstIntegerGrade080Group009Check.group_energy, TaylorFirstIntegerGrade080Group010Check.group_energy, TaylorFirstIntegerGrade080Group011Check.group_energy, TaylorFirstIntegerGrade080Group012Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade080Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade080Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade080Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
