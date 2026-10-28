import Grothe.UpperChaos.TaylorFirstIntegerGrade018Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade018Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade018Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade018Part00000 = 6583113794806516496783990213160386412540718068435491937434021521611750631387806646662390963658207412955237979258880 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade018Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade018Part00064 = 2170513415797344216059689828330635702483327021635407650730995670891730864804876677529816864596353128640905209708544 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade018Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade018Part00128 = 210487657073446048892854755366390473966424854420985135123111372640086447383960552746538988273774281347476630798336 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade018Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade018Part00192 = 12610925453246033985171402102288541194981377174220473751244781335516118357406005604482100801901054652692566114304 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade018Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade018Part00256 = 4869865848496384024164852180929054222234798421687994054767628029899608128981026030081232070551986758707641843712 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade018Part00320.size = 60 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade018Part00320 = 2227869514241538742148008053464131935761040727553185366870097921733918813226119623482908410900155915857081401344 := by decide +kernel

theorem group_length : firstCenterIntegerGrade018Group000.size = 380 := by
  simp only [firstCenterIntegerGrade018Group000, Array.size_append, len0, len1, len2, len3, len4, len5]

theorem group_energy : energy firstCenterIntegerGrade018Group000 = 8983823528493290718488019059194094316343447160815346376461011072430717588876257028196793057811688020270877109125120 := by
  simp only [firstCenterIntegerGrade018Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade018Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade018Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade018Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
