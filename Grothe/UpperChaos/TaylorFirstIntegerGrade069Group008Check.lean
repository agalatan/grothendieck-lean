import Grothe.UpperChaos.TaylorFirstIntegerGrade069Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade069Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade069Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade069Part04096 = 69131671009430712904491703001131338639111019513257439828370110127276474648533519397307787700518400840171520 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade069Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade069Part04160 = 50517489780619105289208814285923444633508090480505489194097879160608030065659585720626182763434340513742848 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade069Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade069Part04224 = 53779550873697142094411433999060695212416300184178185886140683990642972799046619602513427943702814026366976 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade069Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade069Part04288 = 39751106488740231104720466127349579837725825387529371412086429256812152944861472511687131583458282831872000 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade069Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade069Part04352 = 24964380136607712967821456317867988292813606043381524399571171640479508812584887679718302517731928989237248 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade069Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade069Part04416 = 29102175865368751307795192533027458654255101018933185046844308434339457991048573564336690968108471947362304 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade069Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade069Part04480 = 25570999088415391904749098684818963856068629142566447852597008528050799107124292496938228086233080526798848 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade069Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade069Part04544 = 11968568651736655714155864737678759692052403517622777118840625733400957572571928942086784254413257073229824 := by decide +kernel

theorem group_length : firstCenterIntegerGrade069Group008.size = 512 := by
  simp only [firstCenterIntegerGrade069Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade069Group008 = 304785941894615703287354029686858228817950975287974420738548216871610353941430879915214535817600576748781568 := by
  simp only [firstCenterIntegerGrade069Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade069Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade069Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade069Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
