import Grothe.UpperChaos.TaylorSecondIntegerGrade038Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade038Group003Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade038Part01536.size = 24 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade038Part01536 = 536299762798084713059906542821268182375885919043405500922096484603363099503470604438918156572226865202200576 := by decide +kernel

theorem group_length : secondCenterIntegerGrade038Group003.size = 24 := by
  simp only [secondCenterIntegerGrade038Group003, len0]

theorem group_energy : energy secondCenterIntegerGrade038Group003 = 536299762798084713059906542821268182375885919043405500922096484603363099503470604438918156572226865202200576 := by
  simp only [secondCenterIntegerGrade038Group003, sum0]

end Grothe.UpperChaos.TaylorSecondIntegerGrade038Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade038Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade038Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
