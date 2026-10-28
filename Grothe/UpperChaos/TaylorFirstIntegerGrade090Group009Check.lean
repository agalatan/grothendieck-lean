import Grothe.UpperChaos.TaylorFirstIntegerGrade090Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade090Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade090Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade090Part04608 = 1595127194478158992947561238355507184227840090102998737991888713684340265903999717344756126024337012555776 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade090Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade090Part04672 = 147681197718502638073918616485434101273469322244754698951550416237412095008138030645243937316820142377664512 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade090Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade090Part04736 = 91139244208718115337829025473746535268929597109689843435509117115311910270974270269843109601831790990852096 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade090Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade090Part04800 = 1495179255087283753819476190868130292201429158484593103717190050692182283988836753144027941927864330354688 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade090Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade090Part04864 = 57544875169332151301096800876891033111070552523640748164925454287480230904210192135679928881707279192162304 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade090Part04928.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade090Part04928 = 44986310324388364059252067206263108021801013629155073353351757386387037713554016795873139655192751055568896 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade090Part04992.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade090Part04992 = 18394063705562568470667017388840608618253560168236978369808609651263523738567682167845826027009607192281088 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade090Part05056.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade090Part05056 = 23814414561151578632695346466742823774186561312197079109522528525477607280531781365603057756500332159959040 := by decide +kernel

theorem group_length : firstCenterIntegerGrade090Group009.size = 512 := by
  simp only [firstCenterIntegerGrade090Group009, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade090Group009 = 386650412137220858622225911327141847544139876236262013226376961967708927465868809850577783307014104311398400 := by
  simp only [firstCenterIntegerGrade090Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade090Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
