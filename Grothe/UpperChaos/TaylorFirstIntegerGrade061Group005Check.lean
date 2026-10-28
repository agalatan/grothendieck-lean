import Grothe.UpperChaos.TaylorFirstIntegerGrade061Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade061Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade061Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade061Part02560 = 8350447820488012061580680203309739166316646312099790697516988475772355775778352525896476307952461418124541952 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade061Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade061Part02624 = 6464429429545233862508988465280203745384843172021171007450576903418965481893855637605601317066612887863164928 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade061Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade061Part02688 = 5080746530123813724273818622634499532217936859463953442883517090016361353812868508555621983295805572272619520 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade061Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade061Part02752 = 3960607582284055281339351011383188752004587293370526881358533688140620531876323073101528025602501878025814016 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade061Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade061Part02816 = 3234973950539120471341565852054184622795579214321126162988563715509868432907164891942316488873403010957443072 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade061Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade061Part02880 = 2849939862160212511054489423290936271690446343284394918043288147895422905278079197126550805156622600201306112 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade061Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade061Part02944 = 2442915924679693417500398648859611757600299282954930473154505118432812166077243099804683923310814080469565440 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade061Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade061Part03008 = 1947128928040831048024994340679385020045751295379163597163748904107882028680504237878401105805967860229472256 := by decide +kernel

theorem group_length : firstCenterIntegerGrade061Group005.size = 512 := by
  simp only [firstCenterIntegerGrade061Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade061Group005 = 34331190027860972377624286567491748868056089772895057180559722043294288676304391171911179957064189308143927296 := by
  simp only [firstCenterIntegerGrade061Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade061Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade061Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade061Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
