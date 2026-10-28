import Grothe.UpperChaos.TaylorSecondIntegerGrade036Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade036Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade036Group001Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade036Group002Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade036Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade036.size = 1406 := by
  simp only [secondCenterIntegerGrade036, Array.size_append, TaylorSecondIntegerGrade036Group000Check.group_length, TaylorSecondIntegerGrade036Group001Check.group_length, TaylorSecondIntegerGrade036Group002Check.group_length]

theorem grade_energy : secondCenterIntegerGrade036.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    6595476074741415782341098292553103602195307657266796441630933947238643933932886701209456505562525253716632666112 := by
  change energy secondCenterIntegerGrade036 = _
  simp only [secondCenterIntegerGrade036, energy_append, TaylorSecondIntegerGrade036Group000Check.group_energy, TaylorSecondIntegerGrade036Group001Check.group_energy, TaylorSecondIntegerGrade036Group002Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade036Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade036Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade036Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
