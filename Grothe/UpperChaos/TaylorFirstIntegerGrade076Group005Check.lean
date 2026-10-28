import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade076Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade076Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade076Part02560 = 42351180911065210088695586181652531418035181957127578972351558889405123252126119855918214930559007482127056896 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade076Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade076Part02624 = 34237837717695451759879272560729166438756632340619284435431298364605874225446197823881548067362415621714214912 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade076Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade076Part02688 = 27298312087917655700565542266758840456092433056159731541958693641496115966445338084052938896972582257812307968 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade076Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade076Part02752 = 21380796280919125614272436244523467766771224465065089394854837968761422180952659227575365012841745715141017600 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade076Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade076Part02816 = 10587066883580633575739213317548853030131809324298554830564808075085903304685623297623571271191498858692608 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade076Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade076Part02880 = 16447142289829331571843978678560847753353073936707480779925446194559106117550586567331800374244104819477315584 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade076Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade076Part02944 = 12471631967997043085987982306296933241249087336688884811507920703359934482459675596464422955537973914936279040 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade076Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade076Part03008 = 9324215089631726146023554644290293957149541554508466160495136442295583325969569980835531143569666501498634240 := by decide +kernel

theorem group_length : firstCenterIntegerGrade076Group005.size = 512 := by
  simp only [firstCenterIntegerGrade076Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade076Group005 = 163521703411939124600844092096129629884437306456200814651355457012558245454254832759357444952358687811565518848 := by
  simp only [firstCenterIntegerGrade076Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade076Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
