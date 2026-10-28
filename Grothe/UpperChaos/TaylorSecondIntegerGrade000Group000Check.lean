import Grothe.UpperChaos.TaylorSecondIntegerGrade000Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade000Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade000Part00000.size = 2 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade000Part00000 = 192561790502741432262060763123683636638892866994040220566725108078100712499874094128590707862608859564657650696192 := by decide +kernel

theorem group_length : secondCenterIntegerGrade000Group000.size = 2 := by
  simp only [secondCenterIntegerGrade000Group000, len0]

theorem group_energy : energy secondCenterIntegerGrade000Group000 = 192561790502741432262060763123683636638892866994040220566725108078100712499874094128590707862608859564657650696192 := by
  simp only [secondCenterIntegerGrade000Group000, sum0]

end Grothe.UpperChaos.TaylorSecondIntegerGrade000Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade000Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade000Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
