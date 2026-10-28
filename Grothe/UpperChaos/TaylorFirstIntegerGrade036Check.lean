import Grothe.UpperChaos.TaylorFirstIntegerGrade036Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade036Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade036Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade036Group002Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade036Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade036.size = 1406 := by
  simp only [firstCenterIntegerGrade036, Array.size_append, TaylorFirstIntegerGrade036Group000Check.group_length, TaylorFirstIntegerGrade036Group001Check.group_length, TaylorFirstIntegerGrade036Group002Check.group_length]

theorem grade_energy : firstCenterIntegerGrade036.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    2135402146158745441223134400881417687754983749621090471669646378965401386853539609611326836153822453185984700874752 := by
  change energy firstCenterIntegerGrade036 = _
  simp only [firstCenterIntegerGrade036, energy_append, TaylorFirstIntegerGrade036Group000Check.group_energy, TaylorFirstIntegerGrade036Group001Check.group_energy, TaylorFirstIntegerGrade036Group002Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade036Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade036Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade036Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
