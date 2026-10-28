import Grothe.UpperChaos.TaylorFirstIntegerGrade085Group010Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade085Group010Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade085Part05120.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade085Part05120 = 39279175514983329772480816434377994301603580466242141289889522989066250100759816967690237013507026125324288 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade085Part05184.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade085Part05184 = 33847630977333153321974197490684492120902319777450062405714839834890048153925126770687574835626717751541760 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade085Part05248.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade085Part05248 = 24454040465766407703075807156899486570624104055378190963546543708171778588540225214714974954515965923033088 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade085Part05312.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade085Part05312 = 4456099208869393471884039467193348839611861288754616817498004561810745985233649762535912782873718536798208 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade085Part05376.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade085Part05376 = 23992064542754389589794321282168318865782547906757307506801090929488247524870574362139634085842240965443584 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade085Part05440.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade085Part05440 = 19510755518995820000855828705442846233901036185966587104413867459727291745164572760755551114525525445443584 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade085Part05504.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade085Part05504 = 8890215620354676363222298983773211973346793218824483804327686224093567162940551622738612599027388892839936 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade085Part05568.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade085Part05568 = 7521544478648362916618033150186916157230523113316619613497130521871322581049678588778993622367049189687296 := by decide +kernel

theorem group_length : firstCenterIntegerGrade085Group010.size = 512 := by
  simp only [firstCenterIntegerGrade085Group010, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade085Group010 = 161951526327705533139905342670726615063002766012690009505688686229119251842484196050041491008285632830111744 := by
  simp only [firstCenterIntegerGrade085Group010, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade085Group010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group010Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group010Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
