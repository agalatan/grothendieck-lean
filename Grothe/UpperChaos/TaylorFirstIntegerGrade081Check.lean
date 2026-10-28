import Grothe.UpperChaos.TaylorFirstIntegerGrade081Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group007Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group008Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group009Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group010Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group011Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group012Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group013Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade081Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade081.size = 6806 := by
  simp only [firstCenterIntegerGrade081, Array.size_append, TaylorFirstIntegerGrade081Group000Check.group_length, TaylorFirstIntegerGrade081Group001Check.group_length, TaylorFirstIntegerGrade081Group002Check.group_length, TaylorFirstIntegerGrade081Group003Check.group_length, TaylorFirstIntegerGrade081Group004Check.group_length, TaylorFirstIntegerGrade081Group005Check.group_length, TaylorFirstIntegerGrade081Group006Check.group_length, TaylorFirstIntegerGrade081Group007Check.group_length, TaylorFirstIntegerGrade081Group008Check.group_length, TaylorFirstIntegerGrade081Group009Check.group_length, TaylorFirstIntegerGrade081Group010Check.group_length, TaylorFirstIntegerGrade081Group011Check.group_length, TaylorFirstIntegerGrade081Group012Check.group_length, TaylorFirstIntegerGrade081Group013Check.group_length]

theorem grade_energy : firstCenterIntegerGrade081.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    49055804016622901500781548770454272196250053981306634161102229626460559485673972979038488255864032203811705585664 := by
  change energy firstCenterIntegerGrade081 = _
  simp only [firstCenterIntegerGrade081, energy_append, TaylorFirstIntegerGrade081Group000Check.group_energy, TaylorFirstIntegerGrade081Group001Check.group_energy, TaylorFirstIntegerGrade081Group002Check.group_energy, TaylorFirstIntegerGrade081Group003Check.group_energy, TaylorFirstIntegerGrade081Group004Check.group_energy, TaylorFirstIntegerGrade081Group005Check.group_energy, TaylorFirstIntegerGrade081Group006Check.group_energy, TaylorFirstIntegerGrade081Group007Check.group_energy, TaylorFirstIntegerGrade081Group008Check.group_energy, TaylorFirstIntegerGrade081Group009Check.group_energy, TaylorFirstIntegerGrade081Group010Check.group_energy, TaylorFirstIntegerGrade081Group011Check.group_energy, TaylorFirstIntegerGrade081Group012Check.group_energy, TaylorFirstIntegerGrade081Group013Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade081Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade081Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade081Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
