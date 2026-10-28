import Grothe.UpperChaos.TaylorSecondIntegerGrade036Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade036Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade036Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade036Part00512 = 81118132501415838077777827565400946362722114168800243709117889065270892623391865481549828438924761714126749696 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade036Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade036Part00576 = 45728722665694411867179961982956629578078253518931653357794750879557040588918878896630161407799486748104327168 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade036Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade036Part00640 = 54193610713457153286940757045442567746508626620591009374277969768636290809008789261057027028689929951065931776 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade036Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade036Part00704 = 28914867234871170318810994745051535706368259922620217212686635656225476759206913055019032064293933230640332800 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade036Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade036Part00768 = 23422038012188470964762248895476832723809573453437775140320238700824846626691417108956453582100289372481912832 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade036Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade036Part00832 = 9481207827684736975880393190188119262540988227400130162115558418736165689588174168639858148527729411113353216 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade036Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade036Part00896 = 10212743602612306590442758041768380688468050309059205029868446224955679799780352533277838068309611077898862592 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade036Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade036Part00960 = 6853522237394053256375640056696981425516975784048994266450521184714923409243206788586906614583838872508039168 := by decide +kernel

theorem group_length : secondCenterIntegerGrade036Group001.size = 512 := by
  simp only [secondCenterIntegerGrade036Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade036Group001 = 259924844795318141338170581522981993494012842004889228252632009898921316305829597293717105353229580377939509248 := by
  simp only [secondCenterIntegerGrade036Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade036Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade036Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade036Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
