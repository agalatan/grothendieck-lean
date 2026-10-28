import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade082Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade082Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade082Part01536 = 349680118574166835532160818973184651731614389313248640256516141387692852675504234658790090090147631895429513216 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade082Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade082Part01600 = 39167220331092343732826655147166109204941163458047813786067998012445555082296995019056614649139446461983883264 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade082Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade082Part01664 = 342831846402220070295069713718653260802234759304028651677235470848170187005144516659113051781458796758945497088 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade082Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade082Part01728 = 297311219894259082493866042253611056301895441310126775197647016353614491746224343141093574547223657008070656000 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade082Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade082Part01792 = 252775362315477560185316250463295344182276144561937726950410624302451836719036223936241963811782793720072503296 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade082Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade082Part01856 = 493961924589084860588995380146885633073731666371934167702224782245293473510630988090698498923269757459234816 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade082Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade082Part01920 = 212604830935775948865050970376490387170806696393670911760109630575948887701106834110418722268297011186909577216 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade082Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade082Part01984 = 176468307776196119202843641735248785246235098553541129624836398016152771195208610165768319594414661518103674880 := by decide +kernel

theorem group_length : firstCenterIntegerGrade082Group003.size = 512 := by
  simp only [firstCenterIntegerGrade082Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade082Group003 = 1671332868153777045167723088047796480273077424560973583420525504278721875598032388678573035241387268306974539776 := by
  simp only [firstCenterIntegerGrade082Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade082Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
