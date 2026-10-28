import Grothe.UpperChaos.TaylorFirstIntegerGrade086Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade086Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade086Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade086Part00000 = 1655681479386088486917431666785400866981332855886255020920753736512134450757560954144528993957346963408145088512 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade086Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade086Part00064 = 1481791019053398553200971606723473586614216081788661608662410484499160529712160156304194696060861889601616805888 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade086Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade086Part00128 = 1715589426751116983981220506116631177316581600066226619056897460071327902256872285461832021741139282572217417728 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade086Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade086Part00192 = 27733548718609953732789362559247021671920448202692640664116590615808415453117768321520036897193173744353280 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade086Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade086Part00256 = 1928234323087118186995502818440152379751477681599802651979281663127699203115233218015641010687995544140947390464 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade086Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade086Part00320 = 2074992252452013118177707817408680099363445930782257627668053654959808127596545482322042300252633769049013092352 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade086Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade086Part00384 = 2149508519712393896607838170796773268118777337065302600570054886283153757806486457212047069264955248338234507264 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade086Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade086Part00448 = 27650440245547444831408423456714042942605600991941848984777847609314812743713612526688629695462229225930489856 := by decide +kernel

theorem group_length : firstCenterIntegerGrade086Group000.size = 512 := by
  simp only [firstCenterIntegerGrade086Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade086Group000 = 11033475194236395280665813799090384668110109008628650670482893849653214592404025283755296241697292119509849145344 := by
  simp only [firstCenterIntegerGrade086Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade086Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
