import Grothe.UpperChaos.TaylorFirstIntegerGrade051Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade051Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade051Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade051Part01536 = 501167279213539556751675329328580086594998476028474349731267060351893969900589084090451325771028762193553260544 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade051Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade051Part01600 = 189327551106717638644050358103226696425936779649257747318663490012286546563240140002333412967757071691322228736 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade051Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade051Part01664 = 130480695400660509764962473605628847653755292289889070014005934120391426236006279328270802272551354821194547200 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade051Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade051Part01728 = 99744150640817695223734453531587119710105979776839374751396642657894997252841174076756999512919055809292271616 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade051Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade051Part01792 = 147032348358116245510694806858912178006307540583668236217339940890879724761832005236271660958090079942872137728 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade051Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade051Part01856 = 94301208014151354618912014958473130054758373705273186639451317928344047299197345886299751700590464553170501632 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade051Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade051Part01920 = 56125799360981891627680641708475261559861008881111675915164999207128905834629543451508553534953991173541199872 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade051Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade051Part01984 = 34123687281209597114862282317545973758751577855901598372081923584096096588062061194297287911682033685092106240 := by decide +kernel

theorem group_length : firstCenterIntegerGrade051Group003.size = 512 := by
  simp only [firstCenterIntegerGrade051Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade051Group003 = 1252302719376194489256572360412429293764475028770415238959371308752915714436397633266189794629572813870038253568 := by
  simp only [firstCenterIntegerGrade051Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade051Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade051Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade051Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
