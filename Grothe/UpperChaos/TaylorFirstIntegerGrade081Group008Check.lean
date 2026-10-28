import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade081Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade081Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade081Part04096 = 164890641508077393459238075804853796794549075170680622657515427646291278192943796777665874766505592343232512 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade081Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade081Part04160 = 3970480555416037989544152979079453045922956479286822433740567888368340203383974122364911725981936755146752 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade081Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade081Part04224 = 100421297817997117575931470029274198250079520529805577734302071991545303887414184820422125653631360294715392 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade081Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade081Part04288 = 75675356097319974792736269166213463511312742952119328234929407737637406411333260536427198228172827252490240 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade081Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade081Part04352 = 75396207011629555344949277417946592498658155402378333932811960015014562454331440137469976628157565567500288 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade081Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade081Part04416 = 28116675418628502046499181820820589782020879230733025934859272682411389879998323072007730869126842206388224 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade081Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade081Part04480 = 55654138048848313327960540585737935067571832821731230740868485641108787124589965634876819883540147249086464 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade081Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade081Part04544 = 82296012149800770212028230833309210192661981761158884335526391727781185801633014278489529699224356923637760 := by decide +kernel

theorem group_length : firstCenterIntegerGrade081Group008.size = 512 := by
  simp only [firstCenterIntegerGrade081Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade081Group008 = 586420808607717664748887198637235239142777144347893826004553585330158253955627959379724167454340628592197632 := by
  simp only [firstCenterIntegerGrade081Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade081Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
