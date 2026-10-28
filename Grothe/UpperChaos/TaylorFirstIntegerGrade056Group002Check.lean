import Grothe.UpperChaos.TaylorFirstIntegerGrade056Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade056Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade056Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade056Part01024 = 6608237159483358759867077919748277110728096073728672836683452921175981370664628741094464631487200395205061640192 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade056Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade056Part01088 = 4845365416866417642640671003522697736721805258946585227153533143010029031160611584348728327754333219988474691584 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade056Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade056Part01152 = 3854481035951320600665806595616684575849787810278775458220860953390321092749213319308719786984202109173719105536 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade056Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade056Part01216 = 3557692566150888601532176222520057386254349921735146860327836906090666013520747623616535457979343884712595685376 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade056Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade056Part01280 = 1157939490497221680699883256633663581962389128382617276512935467563508567933312922483595115228717633898486431744 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade056Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade056Part01344 = 800648981320614454823000450281540344851409024633800814897638975393168165091237741809744223580539978997364162560 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade056Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade056Part01408 = 593877137444321867915600425370887967151072269390072999793826711142374534299462728857197185822183200090922942464 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade056Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade056Part01472 = 468092740067704280439629357803132909077243083892389399411933121721881648141821338271184938918926381789090938880 := by decide +kernel

theorem group_length : firstCenterIntegerGrade056Group002.size = 512 := by
  simp only [firstCenterIntegerGrade056Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade056Group002 = 21886334527781847888583845231496941612596152570988060873002018199487930423561035999790169667755446803855715598336 := by
  simp only [firstCenterIntegerGrade056Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade056Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade056Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade056Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
