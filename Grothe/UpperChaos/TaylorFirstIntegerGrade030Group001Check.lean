import Grothe.UpperChaos.TaylorFirstIntegerGrade030Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade030Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade030Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade030Part00512 = 4068761876590926498975725205845216349148274899300294107500873454492360428547495761029983069658468728047522545664 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade030Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade030Part00576 = 2235690484848350913401014371510894450007046304040784675782788203703458155505241242132726824870722389412358914048 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade030Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade030Part00640 = 1653870194710740293708175712248647239380418318125505431680038080539551952880720926728963253847659644855416520704 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade030Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade030Part00704 = 792416657370010882153665728960929269147573661542113556765429030639609429757351222494322280162676915222190489600 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade030Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade030Part00768 = 686801652117212425534660250559710267754287512599884268413888700734104868998272697758257003444518873187655614464 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade030Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade030Part00832 = 407288704228061571945579034888783109955191996552981187404854067881880785476209035321743091881794795074939256832 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade030Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade030Part00896 = 233755268247583801639164766860099835742241928549095127508312967171918619434281606521612754376375923239846674432 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade030Part00960.size = 32 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade030Part00960 = 69768800009067158994695197326134150360439822694142087144580325544236270091402261890007850766523382922557259776 := by decide +kernel

theorem group_length : firstCenterIntegerGrade030Group001.size = 480 := by
  simp only [firstCenterIntegerGrade030Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade030Group001 = 10148353638121953546352680268200414671495474443404800442200764830707120510690974753877616129008740651962487275520 := by
  simp only [firstCenterIntegerGrade030Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade030Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade030Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade030Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
