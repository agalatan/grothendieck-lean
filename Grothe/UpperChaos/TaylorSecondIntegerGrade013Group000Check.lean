import Grothe.UpperChaos.TaylorSecondIntegerGrade013Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade013Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade013Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade013Part00000 = 68578428343694350590801873201362485074257602348906676384015112685431578848218991343611982679845776180545272676352 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade013Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade013Part00064 = 2062348763170681914966817029944689825942068772333697610507318398041706474986993981972257715331683917333782331392 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade013Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade013Part00128 = 833231902007351102263820093122451984112892085010718259788479480149540561896404884838547693032733394716839641088 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade013Part00192.size = 18 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade013Part00192 = 42122923824776245222009506678394397727701163436373472641142293105485641027627074881784794316347033138143166464 := by decide +kernel

theorem group_length : secondCenterIntegerGrade013Group000.size = 210 := by
  simp only [secondCenterIntegerGrade013Group000, Array.size_append, len0, len1, len2, len3]

theorem group_energy : energy secondCenterIntegerGrade013Group000 = 71516131932697159853254519831108021282040264369687465726952052856728311526130017285304572882526540525734037815296 := by
  simp only [secondCenterIntegerGrade013Group000, energy_append, sum0, sum1, sum2, sum3]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade013Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade013Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade013Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
