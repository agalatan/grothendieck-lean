import Grothe.UpperChaos.TaylorFirstIntegerGrade063Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade063Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade063Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade063Part03072 = 1560554291679927769516272658748282283411113616722921609466845167157017378372605178032347267606229054530781184 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade063Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade063Part03136 = 1362354130007517488236306359093252536620340940268095353589693629999792099768574784752491008994660987099414528 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade063Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade063Part03200 = 1083286969053238792797712406080734460735875390947028881019728692660540910598628592591863669761561515723325440 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade063Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade063Part03264 = 835477040588865380617718706124338382265923162943768008351140269004481176591503068088127146531109927940784128 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade063Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade063Part03328 = 626022865253235188424652584623828263401172320665992655301902488728423685351928690921325618040602605377290240 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade063Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade063Part03392 = 433355935291511505368183375711038210548461529504200892547307058068034935069645184276935507416344602607616000 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade063Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade063Part03456 = 346594816204759167360048398840459046032364180805773007351084822331975598332254520617116833218058511833890816 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade063Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade063Part03520 = 220912593928834013782141013784460687653221752657243345262422426293812163273680534057074347283755642868727808 := by decide +kernel

theorem group_length : firstCenterIntegerGrade063Group006.size = 512 := by
  simp only [firstCenterIntegerGrade063Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade063Group006 = 6468558642007889306103035503006393870668472894515023752890124554244077947358820553337281398852322847981830144 := by
  simp only [firstCenterIntegerGrade063Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade063Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade063Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade063Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
