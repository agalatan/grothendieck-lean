import Grothe.UpperChaos.TaylorSecondIntegerGrade027Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade027Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade027Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade027Part00512 = 97983426519850530106693837011115141193978746892357006301492484412825445161978485309779154102961545145732825088 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade027Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade027Part00576 = 55693918193202554954964885029207122799463435316452871330558606169120528943502316145011659270557745694499667968 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade027Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade027Part00640 = 39749791727342392040896228678365025478469231235992615906314510349454491355140614561899691854379551024736108544 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade027Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade027Part00704 = 29495622690872515906613510525192747864625779965960796918612667221766450473315880963374525203771474948317511680 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade027Part00768.size = 44 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade027Part00768 = 24508930656346664510036461026144316983304739927070645534065268201276891283226509711905098447521319779209052160 := by decide +kernel

theorem group_length : secondCenterIntegerGrade027Group001.size = 300 := by
  simp only [secondCenterIntegerGrade027Group001, Array.size_append, len0, len1, len2, len3, len4]

theorem group_energy : energy secondCenterIntegerGrade027Group001 = 247431689787614657519204922270024354319841933337833935991043536354443807217163806691970128879191636592495165440 := by
  simp only [secondCenterIntegerGrade027Group001, energy_append, sum0, sum1, sum2, sum3, sum4]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade027Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade027Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade027Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
