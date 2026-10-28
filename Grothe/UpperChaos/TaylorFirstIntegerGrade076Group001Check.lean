import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade076Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade076Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade076Part00512 = 5789498166218901488661986110896582987307469766125336192040413517005378296663428980237114455174708548503238344704 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade076Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade076Part00576 = 4729982803642973178560777404715682893183319547197571488066875454799373283133172471384933928139923776965959483392 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade076Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade076Part00640 = 3220756127291662173759468932177194877436159151998298061826474023767561736382625178651604592067936462523233992704 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade076Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade076Part00704 = 602774045286150026231040527735360103716605274196326205807279645851127916747972666413235724014069611299466117120 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade076Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade076Part00768 = 3040213724832294139802168671765951441419503798573376321704142828770143774358628656992842533915066618471755284480 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade076Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade076Part00832 = 2290532843777440599822831258139442116970004726662600807793628138365022788962530887962270614313422573985431814144 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade076Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade076Part00896 = 1658229371296418528093986478945376465672344318016013137790295315363879853913957198627657877720144467820520931328 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade076Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade076Part00960 = 1238440873498497308198444798031835123004479634626014749695804581839172955665681885931870101853921767637332787200 := by decide +kernel

theorem group_length : firstCenterIntegerGrade076Group001.size = 512 := by
  simp only [firstCenterIntegerGrade076Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade076Group001 = 22570427955844337443130704182407426008709886217395536964724913505761660605827997926201529827199193827206938755072 := by
  simp only [firstCenterIntegerGrade076Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade076Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
