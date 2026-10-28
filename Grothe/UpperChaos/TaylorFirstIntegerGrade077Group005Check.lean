import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade077Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade077Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade077Part02560 = 39475675145535101144290952362618745931267446654719627500662156941236159640728560639992481964055252123206549504 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade077Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade077Part02624 = 21563368180306171445575872233244717432451136988964629801382096137587227981368452508980497915063349916356050944 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade077Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade077Part02688 = 10563697621579796862387147059738678889114557998185960536858246440375341713326594570272893399679654696302149632 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade077Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade077Part02752 = 25859621411454477417435472747581545868106749219956762831704949829559669474504497321884182174734978111812665344 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade077Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade077Part02816 = 20459452675228027027931284310564193358456563912864018448980054796989436672108212427636317200388562429673472000 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade077Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade077Part02880 = 15848872215638349652661323705838690029997949022797123251157120958324081520195706950552428594828814385332355072 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade077Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade077Part02944 = 12040254847885577267139757818557055001517716680635378279713262668403199274806372333023007801173138326142582784 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade077Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade077Part03008 = 12876818754636129485578939987057119678018930761312999412137355786178629167367086387196366339047948858425344 := by decide +kernel

theorem group_length : firstCenterIntegerGrade077Group005.size = 512 := by
  simp only [firstCenterIntegerGrade077Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade077Group005 = 145823818916382136946907389178130683630590139408884813649870025128261294906205763838729005416262797937684250624 := by
  simp only [firstCenterIntegerGrade077Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade077Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
