import Grothe.UpperChaos.TaylorFirstIntegerGrade042Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade042Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade042Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade042Part00000 = 472623718054295209818115731499541208719867963582561360980384567156070541121765757002817547469751294052982440591360 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade042Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade042Part00064 = 384257673589886587602503726710072531553176090511308777286702265124966318227074187416561538915730103149065045803008 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade042Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade042Part00128 = 960398709275104368858457818838722604695091667774712896301858580608003159146427560848801599522540074919044457693184 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade042Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade042Part00192 = 469573958116265137583942362416225827707245723291304066248162852434159362589430685222394306981893851622358934093824 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade042Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade042Part00256 = 654887252225237462797751560186232096971950273456844211951908899425133896339818602470083302644954667058816148832256 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade042Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade042Part00320 = 162547731862037448617097424415710397917881854252240235253383480410063042711190206028686531640112125981580890996736 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade042Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade042Part00384 = 160457124018628421991986897319701596316558490673773856672642962764688897538512779641252788442108288319654790692864 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade042Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade042Part00448 = 55614271064899530497239427315928885567357627313350134217719865536245579514601151356015781034058708578377612132352 := by decide +kernel

theorem group_length : firstCenterIntegerGrade042Group000.size = 512 := by
  simp only [firstCenterIntegerGrade042Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade042Group000 = 3320360438206354167767094948702135149449129690856095538912763473459330797188820929986613396651149113681880320835584 := by
  simp only [firstCenterIntegerGrade042Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade042Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade042Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade042Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
