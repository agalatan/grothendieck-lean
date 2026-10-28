import Grothe.UpperChaos.TaylorFirstIntegerGrade029Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade029Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade029Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade029Part00000 = 1464221576877808956098797416352257068794212579906698155225372772622663710685237162577803462030894489836737288732672 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade029Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade029Part00064 = 1121291072014846734148318986696353347695493978238285841542676677832974538871906895388980653136834652691197419585536 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade029Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade029Part00128 = 605944770467867446167616480759683963211170998378251261877987862032988879719634850662131667274482679400964472963072 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade029Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade029Part00192 = 293992872879785507611092242970647052806371830991235636392448773984133963768804111495256462061168382881472983334912 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade029Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade029Part00256 = 96830825718838284981483260763306196278998835653215482551630668624946690589612635173362487898645577946449083105280 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade029Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade029Part00320 = 40948016390649731375401852181803704114922394109545202039085092324795814551473122779348965841677373487254891134976 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade029Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade029Part00384 = 16364809773194205821713740447043926971245627590141084249379738488721457481586951514458595789053122926604491685888 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade029Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade029Part00448 = 7246972122873345605917023877662910979829478743406079297658925847641170627644551863624753323864476469667433545728 := by decide +kernel

theorem group_length : firstCenterIntegerGrade029Group000.size = 512 := by
  simp only [firstCenterIntegerGrade029Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade029Group000 = 3646840916245864211810341004048758170852245723610778743176240511758866226295900281454967047356620755640348064088064 := by
  simp only [firstCenterIntegerGrade029Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade029Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade029Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade029Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
