import Grothe.UpperChaos.TaylorSecondIntegerGrade040Data
import Grothe.UpperChaos.TaylorSecondIntegerGrade040Group000Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade040Group001Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade040Group002Check
import Grothe.UpperChaos.TaylorSecondIntegerGrade040Group003Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade040Check
open ArraySquareEnergy

theorem grade_length : secondCenterIntegerGrade040.size = 1722 := by
  simp only [secondCenterIntegerGrade040, Array.size_append, TaylorSecondIntegerGrade040Group000Check.group_length, TaylorSecondIntegerGrade040Group001Check.group_length, TaylorSecondIntegerGrade040Group002Check.group_length, TaylorSecondIntegerGrade040Group003Check.group_length]

theorem grade_energy : secondCenterIntegerGrade040.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    3896421118617596927591504617826722646293356193346878331805203108719651006585816622366908291281354602803439337472 := by
  change energy secondCenterIntegerGrade040 = _
  simp only [secondCenterIntegerGrade040, energy_append, TaylorSecondIntegerGrade040Group000Check.group_energy, TaylorSecondIntegerGrade040Group001Check.group_energy, TaylorSecondIntegerGrade040Group002Check.group_energy, TaylorSecondIntegerGrade040Group003Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade040Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade040Check.grade_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade040Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
