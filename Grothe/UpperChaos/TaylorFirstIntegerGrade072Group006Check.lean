import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade072Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade072Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade072Part03072 = 3696870720454264056023404349160658905361577190674118216988637236088495129044356814803398185259088341104590848 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade072Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade072Part03136 = 2481645233210750615948307200818836475572466819875928052797415921746134667211138976591398624918303831635263488 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade072Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade072Part03200 = 1639806624964936547299769893367831927282457190867104326796014557302967902389977181186327715720179793455480832 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade072Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade072Part03264 = 326804097683148925428295303562328510778728800246827312458522993767368998073519617652818803439153833140289536 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade072Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade072Part03328 = 784232535647123953851954696131128844181842083588376371972942865887618370099563080430359552180514306570321920 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade072Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade072Part03392 = 768437459169089277060666196248162227368236647304905128281447666434031952109426863696408885259394735402909696 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade072Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade072Part03456 = 541113308763702863413190911881699594986990936521036819248904556243408549797384783009685778673048563885277184 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade072Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade072Part03520 = 370996701082821243748390304549553065049284560181806977709113337796485459491003295516333895042601963535466496 := by decide +kernel

theorem group_length : firstCenterIntegerGrade072Group006.size = 512 := by
  simp only [firstCenterIntegerGrade072Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade072Group006 = 10609906680975837482773978855720199550581584229260103206252999135266511028216370612886731440492285368729600000 := by
  simp only [firstCenterIntegerGrade072Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade072Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
