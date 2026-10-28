import Grothe.UpperChaos.TaylorFirstIntegerGrade087Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade087Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade087Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade087Part04608 = 86509416330286053065772737597330602475110228280258460821094766252922890036567126746820029882968910854094848 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade087Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade087Part04672 = 73671471140948936801396660230094778660064445910350603221237222647236755733953194482204030165763308379963392 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade087Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade087Part04736 = 7031611214033215432872708178315141676676405079348144788717931226366932910465720933461888640668790861856768 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade087Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade087Part04800 = 57723720378137282722074285549046047414970050144053202309704750427557790713629542504954818648081299499122688 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade087Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade087Part04864 = 55084061026224326106714136352291563710545603417628440194167547929098100444800599837943209767234141690003456 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade087Part04928.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade087Part04928 = 45761372080639956576002066994288497344778870464163722821224323847441364005034853661542695853396150374629376 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade087Part04992.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade087Part04992 = 1909690912010086090080502283217497889748812790042702682593109229357546128827148990584441629705261245530112 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade087Part05056.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade087Part05056 = 41755514325307920836157520583130602827346215079050923164468526776488812487515065227708522705516202622451712 := by decide +kernel

theorem group_length : firstCenterIntegerGrade087Group009.size = 512 := by
  simp only [firstCenterIntegerGrade087Group009, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade087Group009 = 369446857407587777631070617767714731999240631164896200003208178336470192460793252385219637293334065527652352 := by
  simp only [firstCenterIntegerGrade087Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade087Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
