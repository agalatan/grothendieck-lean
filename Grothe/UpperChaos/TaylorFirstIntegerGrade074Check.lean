import Grothe.UpperChaos.TaylorFirstIntegerGrade074Data
import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group000Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group001Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group002Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group003Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group004Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group005Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group006Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group007Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group008Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group009Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group010Check
import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group011Check
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade074Check
open ArraySquareEnergy

theorem grade_length : firstCenterIntegerGrade074.size = 5700 := by
  simp only [firstCenterIntegerGrade074, Array.size_append, TaylorFirstIntegerGrade074Group000Check.group_length, TaylorFirstIntegerGrade074Group001Check.group_length, TaylorFirstIntegerGrade074Group002Check.group_length, TaylorFirstIntegerGrade074Group003Check.group_length, TaylorFirstIntegerGrade074Group004Check.group_length, TaylorFirstIntegerGrade074Group005Check.group_length, TaylorFirstIntegerGrade074Group006Check.group_length, TaylorFirstIntegerGrade074Group007Check.group_length, TaylorFirstIntegerGrade074Group008Check.group_length, TaylorFirstIntegerGrade074Group009Check.group_length, TaylorFirstIntegerGrade074Group010Check.group_length, TaylorFirstIntegerGrade074Group011Check.group_length]

theorem grade_energy : firstCenterIntegerGrade074.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    94590725002591445482045221389946033312709070404946737882158378815350875544173144912265311050451203043702217900032 := by
  change energy firstCenterIntegerGrade074 = _
  simp only [firstCenterIntegerGrade074, energy_append, TaylorFirstIntegerGrade074Group000Check.group_energy, TaylorFirstIntegerGrade074Group001Check.group_energy, TaylorFirstIntegerGrade074Group002Check.group_energy, TaylorFirstIntegerGrade074Group003Check.group_energy, TaylorFirstIntegerGrade074Group004Check.group_energy, TaylorFirstIntegerGrade074Group005Check.group_energy, TaylorFirstIntegerGrade074Group006Check.group_energy, TaylorFirstIntegerGrade074Group007Check.group_energy, TaylorFirstIntegerGrade074Group008Check.group_energy, TaylorFirstIntegerGrade074Group009Check.group_energy, TaylorFirstIntegerGrade074Group010Check.group_energy, TaylorFirstIntegerGrade074Group011Check.group_energy]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade074Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade074Check.grade_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade074Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
