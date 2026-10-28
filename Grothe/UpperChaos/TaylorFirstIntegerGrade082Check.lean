import Grothe.UpperChaos.TaylorFirstIntegerGrade082Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group007Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group008Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group009Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group010Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group011Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group012Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group013Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade082Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade082.size = 6972 := by
  simp only [firstCenterIntegerGrade082, Array.size_append, TaylorFirstIntegerGrade082Group000Check.group_length, TaylorFirstIntegerGrade082Group001Check.group_length, TaylorFirstIntegerGrade082Group002Check.group_length, TaylorFirstIntegerGrade082Group003Check.group_length, TaylorFirstIntegerGrade082Group004Check.group_length, TaylorFirstIntegerGrade082Group005Check.group_length, TaylorFirstIntegerGrade082Group006Check.group_length, TaylorFirstIntegerGrade082Group007Check.group_length, TaylorFirstIntegerGrade082Group008Check.group_length, TaylorFirstIntegerGrade082Group009Check.group_length, TaylorFirstIntegerGrade082Group010Check.group_length, TaylorFirstIntegerGrade082Group011Check.group_length, TaylorFirstIntegerGrade082Group012Check.group_length, TaylorFirstIntegerGrade082Group013Check.group_length]

theorem grade_energy : firstCenterIntegerGrade082.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    43260465740478325089373306934812415749275722359005038781154560988176773345945906416347278602870229372911245852672 := by
  change energy firstCenterIntegerGrade082 = _
  simp only [firstCenterIntegerGrade082, energy_append, TaylorFirstIntegerGrade082Group000Check.group_energy, TaylorFirstIntegerGrade082Group001Check.group_energy, TaylorFirstIntegerGrade082Group002Check.group_energy, TaylorFirstIntegerGrade082Group003Check.group_energy, TaylorFirstIntegerGrade082Group004Check.group_energy, TaylorFirstIntegerGrade082Group005Check.group_energy, TaylorFirstIntegerGrade082Group006Check.group_energy, TaylorFirstIntegerGrade082Group007Check.group_energy, TaylorFirstIntegerGrade082Group008Check.group_energy, TaylorFirstIntegerGrade082Group009Check.group_energy, TaylorFirstIntegerGrade082Group010Check.group_energy, TaylorFirstIntegerGrade082Group011Check.group_energy, TaylorFirstIntegerGrade082Group012Check.group_energy, TaylorFirstIntegerGrade082Group013Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade082Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade082Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade082Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
