import Grothe.UpperChaos.TaylorFirstIntegerGrade031Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade031Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade031Part01024.size = 32 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade031Part01024 = 63023756797914349768751103690623754146544142764545660181917331983612904848379922666919813596045900630133309440 := by decide +kernel

theorem group_length : firstCenterIntegerGrade031Group002.size = 32 := by
  simp only [firstCenterIntegerGrade031Group002, len0]

theorem group_energy : energy firstCenterIntegerGrade031Group002 = 63023756797914349768751103690623754146544142764545660181917331983612904848379922666919813596045900630133309440 := by
  simp only [firstCenterIntegerGrade031Group002, sum0]

end Grothe.UpperChaos.TaylorFirstIntegerGrade031Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade031Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade031Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
