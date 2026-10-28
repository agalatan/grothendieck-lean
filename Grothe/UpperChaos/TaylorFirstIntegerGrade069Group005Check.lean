import Grothe.UpperChaos.TaylorFirstIntegerGrade069Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade069Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade069Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade069Part02560 = 1146401919322949163131915698631916738799187170916526318773979716735323316466822089232943397436573608593850368 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade069Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade069Part02624 = 22841263059400519041982599103410014642927179305789970334518153440318593415376021907729654209348557301732081664 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade069Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade069Part02688 = 16932083193749889293882129240082564751038454630863439546900112270545021207257792929624617735271750751997657088 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade069Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade069Part02752 = 12040386103532188221076196942582264417494350428861215811220788793502254973328742493983075130061116866127986688 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade069Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade069Part02816 = 8437279336388456427831442053515197461229050666696931028686428143968500099178574158377755697919980504010981376 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade069Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade069Part02880 = 5817068273556658295572628321790055099110570396700880830914913850102039514433313250286996116733647876586995712 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade069Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade069Part02944 = 3962220666654606160752449366578910053428736399115743952093242455291741997735794042123881752914259407131377664 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade069Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade069Part03008 = 2688174135435438730088182545040278541791008543448773825135913916241952588896029950770310280813385548887490560 := by decide +kernel

theorem group_length : firstCenterIntegerGrade069Group005.size = 512 := by
  simp only [firstCenterIntegerGrade069Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade069Group005 = 73864876688040705334317543271631201705818537542393481648243532586705427112673090822129234320499271865068421120 := by
  simp only [firstCenterIntegerGrade069Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade069Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade069Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade069Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
