import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade080Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade080Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade080Part04096 = 129636216044320920748481502622660513175552101191429502640843935404778561293922995513232545148275881978888192 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade080Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade080Part04160 = 96223085294555688374560148246640845701371437461358624325338299749515043178354855337336251243968274565693440 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade080Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade080Part04224 = 88467439192288013717863822435483478031953070069238845685611573353792340683382150085676299485340494515404800 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade080Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade080Part04288 = 93515364891611273129811377485160203348194477688034925508872761996850323012236136751576233131797592026382336 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade080Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade080Part04352 = 4208703938870480094523523631972493074554083515714045707173048001845915398789286139103103303798181863620608 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade080Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade080Part04416 = 95460577922158494480778831928648710256044866096791586537704836610031009061603700630451135832773543663239168 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade080Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade080Part04480 = 86237551987524663621666431072754443271841783826183606952357341021555679140575428787451562324813446209601536 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade080Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade080Part04544 = 72645012816034964085492869078073140233961188842832187474114551573306440272595319796373680188962229599600640 := by decide +kernel

theorem group_length : firstCenterIntegerGrade080Group008.size = 512 := by
  simp only [firstCenterIntegerGrade080Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade080Group008 = 666393952087364498253178506501393827093473008691583324832016347711675312041459873041200810659729644422430720 := by
  simp only [firstCenterIntegerGrade080Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade080Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
