import Grothe.UpperChaos.TaylorFirstIntegerGrade087Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade087Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade087Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade087Part00000 = 1522993594839029182031535561908766225821662772989593274619391774568846984720189783169139493270978834043609546752 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade087Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade087Part00064 = 1319884273438238677934372903973309546849956830748078648927414754995655203818545337709353313296232965112510545920 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade087Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade087Part00128 = 1616952910512573585467975720983383673446311727580325238378641912814502731579266600595595256462335959633009836032 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade087Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade087Part00192 = 256768464383074798079359816924567505849521653409529585995872270364363936220046316137473068473520789347368960 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade087Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade087Part00256 = 1796442482536263578732539852114316101159653913959328592214202040387454128187253675166117227995956528070057263104 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade087Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade087Part00320 = 1906317854042955927964225955596580115250144286882750538566404803445231177357018758078676934930598173320977317888 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade087Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade087Part00384 = 1353801142759030268205097309840785740993941042603719982619523139886263745479434832176757468549259586717232398336 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade087Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade087Part00448 = 634694500630043164198708067669258120087722955677046824450940278304093484681046227785161141992960502104980455424 := by decide +kernel

theorem group_length : firstCenterIntegerGrade087Group000.size = 512 := by
  simp only [firstCenterIntegerGrade087Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade087Group000 = 10151343527222517459332534731903324091115243052094252629362514576672411819758975260996938309566796069791724732416 := by
  simp only [firstCenterIntegerGrade087Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade087Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
