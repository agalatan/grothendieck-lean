import Grothe.UpperChaos.TaylorFirstIntegerGrade059Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade059Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade059Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade059Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade059Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade059Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade059Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade059Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade059Group007Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade059Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade059.size = 3660 := by
  simp only [firstCenterIntegerGrade059, Array.size_append, TaylorFirstIntegerGrade059Group000Check.group_length, TaylorFirstIntegerGrade059Group001Check.group_length, TaylorFirstIntegerGrade059Group002Check.group_length, TaylorFirstIntegerGrade059Group003Check.group_length, TaylorFirstIntegerGrade059Group004Check.group_length, TaylorFirstIntegerGrade059Group005Check.group_length, TaylorFirstIntegerGrade059Group006Check.group_length, TaylorFirstIntegerGrade059Group007Check.group_length]

theorem grade_energy : firstCenterIntegerGrade059.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    1022538763274204139340513591556109170206191613054644740471061335034953952847751578615070080761795414480935033241600 := by
  change energy firstCenterIntegerGrade059 = _
  simp only [firstCenterIntegerGrade059, energy_append, TaylorFirstIntegerGrade059Group000Check.group_energy, TaylorFirstIntegerGrade059Group001Check.group_energy, TaylorFirstIntegerGrade059Group002Check.group_energy, TaylorFirstIntegerGrade059Group003Check.group_energy, TaylorFirstIntegerGrade059Group004Check.group_energy, TaylorFirstIntegerGrade059Group005Check.group_energy, TaylorFirstIntegerGrade059Group006Check.group_energy, TaylorFirstIntegerGrade059Group007Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade059Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade059Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade059Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
