import Grothe.UpperChaos.TaylorFirstIntegerGrade076Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group007Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group008Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group009Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group010Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group011Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade076Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade076.size = 6006 := by
  simp only [firstCenterIntegerGrade076, Array.size_append, TaylorFirstIntegerGrade076Group000Check.group_length, TaylorFirstIntegerGrade076Group001Check.group_length, TaylorFirstIntegerGrade076Group002Check.group_length, TaylorFirstIntegerGrade076Group003Check.group_length, TaylorFirstIntegerGrade076Group004Check.group_length, TaylorFirstIntegerGrade076Group005Check.group_length, TaylorFirstIntegerGrade076Group006Check.group_length, TaylorFirstIntegerGrade076Group007Check.group_length, TaylorFirstIntegerGrade076Group008Check.group_length, TaylorFirstIntegerGrade076Group009Check.group_length, TaylorFirstIntegerGrade076Group010Check.group_length, TaylorFirstIntegerGrade076Group011Check.group_length]

theorem grade_energy : firstCenterIntegerGrade076.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    75974649140320719987859272481348379177411752917117915980405087483623844160446558329349175944444994166951264649216 := by
  change energy firstCenterIntegerGrade076 = _
  simp only [firstCenterIntegerGrade076, energy_append, TaylorFirstIntegerGrade076Group000Check.group_energy, TaylorFirstIntegerGrade076Group001Check.group_energy, TaylorFirstIntegerGrade076Group002Check.group_energy, TaylorFirstIntegerGrade076Group003Check.group_energy, TaylorFirstIntegerGrade076Group004Check.group_energy, TaylorFirstIntegerGrade076Group005Check.group_energy, TaylorFirstIntegerGrade076Group006Check.group_energy, TaylorFirstIntegerGrade076Group007Check.group_energy, TaylorFirstIntegerGrade076Group008Check.group_energy, TaylorFirstIntegerGrade076Group009Check.group_energy, TaylorFirstIntegerGrade076Group010Check.group_energy, TaylorFirstIntegerGrade076Group011Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade076Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade076Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade076Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
