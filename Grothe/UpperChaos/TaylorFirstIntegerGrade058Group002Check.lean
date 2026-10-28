import Grothe.UpperChaos.TaylorFirstIntegerGrade058Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade058Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade058Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade058Part01024 = 7231935527063264293390332146029338450507439339866273607198168062832021950942998109948492498177645900445203300352 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade058Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade058Part01088 = 5410414131296934790712935018451730290190337603882367669953191547494223777106980415424937458974107120678637404160 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade058Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade058Part01152 = 4100132040497741173248731924501660072696442593659101322114215343426661341147560159183620503041951356113509154816 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade058Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade058Part01216 = 3036395855559576502596969938178730175083933144492889963220841390574853275978143914949080308684312162707292815360 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade058Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade058Part01280 = 2213438769634585709431208782487468457744721772908208166081320013381343881628192528912330955865831175960479662080 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade058Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade058Part01344 = 1599694908949767745922945896237869067444627093537959372494392069063781083356505701320146160589591830179642081280 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade058Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade058Part01408 = 1155055463764575233122324073518013150647467111894237306696408108568648181218318179794571191504335983716339810304 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade058Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade058Part01472 = 841187234422515121490659552993445621471172147458460448092900599545518038704267809850905538500389756309814116352 := by decide +kernel

theorem group_length : firstCenterIntegerGrade058Group002.size = 512 := by
  simp only [firstCenterIntegerGrade058Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade058Group002 = 25588253931188960569916107332398255285786140807699497855851437134887051530082966819384084615338165286110918344704 := by
  simp only [firstCenterIntegerGrade058Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade058Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade058Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade058Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
