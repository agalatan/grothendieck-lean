import Grothe.UpperChaos.TaylorFirstIntegerGrade075Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group007Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group008Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group009Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group010Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group011Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade075Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade075.size = 5852 := by
  simp only [firstCenterIntegerGrade075, Array.size_append, TaylorFirstIntegerGrade075Group000Check.group_length, TaylorFirstIntegerGrade075Group001Check.group_length, TaylorFirstIntegerGrade075Group002Check.group_length, TaylorFirstIntegerGrade075Group003Check.group_length, TaylorFirstIntegerGrade075Group004Check.group_length, TaylorFirstIntegerGrade075Group005Check.group_length, TaylorFirstIntegerGrade075Group006Check.group_length, TaylorFirstIntegerGrade075Group007Check.group_length, TaylorFirstIntegerGrade075Group008Check.group_length, TaylorFirstIntegerGrade075Group009Check.group_length, TaylorFirstIntegerGrade075Group010Check.group_length, TaylorFirstIntegerGrade075Group011Check.group_length]

theorem grade_energy : firstCenterIntegerGrade075.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    83717877863845330732287567388574970479229351285962633102781493712837139186741797252695203711071835486784319389696 := by
  change energy firstCenterIntegerGrade075 = _
  simp only [firstCenterIntegerGrade075, energy_append, TaylorFirstIntegerGrade075Group000Check.group_energy, TaylorFirstIntegerGrade075Group001Check.group_energy, TaylorFirstIntegerGrade075Group002Check.group_energy, TaylorFirstIntegerGrade075Group003Check.group_energy, TaylorFirstIntegerGrade075Group004Check.group_energy, TaylorFirstIntegerGrade075Group005Check.group_energy, TaylorFirstIntegerGrade075Group006Check.group_energy, TaylorFirstIntegerGrade075Group007Check.group_energy, TaylorFirstIntegerGrade075Group008Check.group_energy, TaylorFirstIntegerGrade075Group009Check.group_energy, TaylorFirstIntegerGrade075Group010Check.group_energy, TaylorFirstIntegerGrade075Group011Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade075Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade075Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade075Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
