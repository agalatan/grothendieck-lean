import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade082Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade082Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade082Part04608 = 70765020252393668711759165249256279694828668442051507887417716658767806552034805137983710182034830341963776 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade082Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade082Part04672 = 69867275830936309890220226637183128409968905340941078185457084092693894810058934501258802994043630085210112 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade082Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade082Part04736 = 60002006708194491917908540609401669952935598874963070919185146978042703131482614983886482424272168993947648 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade082Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade082Part04800 = 4846199169122599524777353356273294480287456356151257133925272923001397463958867598148285436315061639446528 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade082Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade082Part04864 = 46990209764228244424209097147473860632977769974979592735845924304423586706483440821518821570156190739988480 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade082Part04928.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade082Part04928 = 42657841623018783611052513277372973403249125467391418272062375804638134877261879474006242469711327015206912 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade082Part04992.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade082Part04992 = 33948677956291164502424533188469443058523004945917959512718938254971289543224771720337595890762156976635904 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade082Part05056.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade082Part05056 = 10806313795363096955845874919475786407930008897081612899074446282119717722859598725329167870287346508234752 := by decide +kernel

theorem group_length : firstCenterIntegerGrade082Group009.size = 512 := by
  simp only [firstCenterIntegerGrade082Group009, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade082Group009 = 339883545099548359538197304384906436040700538299477497545686905298658530807364912962469108837582712300634112 := by
  simp only [firstCenterIntegerGrade082Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade082Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
