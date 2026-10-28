import Grothe.UpperChaos.TaylorFirstIntegerGrade065Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade065Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade065Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade065Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade065Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade065Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade065Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade065Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade065Group007Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade065Group008Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade065Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade065.size = 4422 := by
  simp only [firstCenterIntegerGrade065, Array.size_append, TaylorFirstIntegerGrade065Group000Check.group_length, TaylorFirstIntegerGrade065Group001Check.group_length, TaylorFirstIntegerGrade065Group002Check.group_length, TaylorFirstIntegerGrade065Group003Check.group_length, TaylorFirstIntegerGrade065Group004Check.group_length, TaylorFirstIntegerGrade065Group005Check.group_length, TaylorFirstIntegerGrade065Group006Check.group_length, TaylorFirstIntegerGrade065Group007Check.group_length, TaylorFirstIntegerGrade065Group008Check.group_length]

theorem grade_energy : firstCenterIntegerGrade065.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    405312434880849923755577355742592144205185716015069068940683873029583740085638134079649459927931269973842535120896 := by
  change energy firstCenterIntegerGrade065 = _
  simp only [firstCenterIntegerGrade065, energy_append, TaylorFirstIntegerGrade065Group000Check.group_energy, TaylorFirstIntegerGrade065Group001Check.group_energy, TaylorFirstIntegerGrade065Group002Check.group_energy, TaylorFirstIntegerGrade065Group003Check.group_energy, TaylorFirstIntegerGrade065Group004Check.group_energy, TaylorFirstIntegerGrade065Group005Check.group_energy, TaylorFirstIntegerGrade065Group006Check.group_energy, TaylorFirstIntegerGrade065Group007Check.group_energy, TaylorFirstIntegerGrade065Group008Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade065Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade065Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade065Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
