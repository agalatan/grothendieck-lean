import Grothe.UpperChaos.TaylorFirstIntegerGrade000Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade000Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade000Part00000.size = 2 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade000Part00000 = 1731414224949200957893676281539875717006855473698817548582497275659777964322286547117552004641992518557438019467476992 := by decide +kernel

theorem group_length : firstCenterIntegerGrade000Group000.size = 2 := by
  simp only [firstCenterIntegerGrade000Group000, len0]

theorem group_energy : energy firstCenterIntegerGrade000Group000 = 1731414224949200957893676281539875717006855473698817548582497275659777964322286547117552004641992518557438019467476992 := by
  simp only [firstCenterIntegerGrade000Group000, sum0]

end Grothe.UpperChaos.TaylorFirstIntegerGrade000Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade000Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade000Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
