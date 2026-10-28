import Grothe.UpperChaos.TaylorFirstIntegerGrade084Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade084Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade084Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade084Part02048 = 155714153413618893326033808916575203890481111848542616398329690191573401744189241607972161542584085457213063168 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade084Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade084Part02112 = 129223511798656168412675417729087151950969696371209110864825532723934927711041598791798558829236018174480089088 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade084Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade084Part02176 = 104775219181555785829657030676054767649781384993166691861413442585801916066033545886498858774371817987623616512 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade084Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade084Part02240 = 1665968001923000737201175567724755704115866880208022318836906986133930168025881955456316142393434937988481024 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade084Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade084Part02304 = 87225582926780675660564348299398519039846771147368144172875445787570296874680991594844123483461398210610724864 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade084Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade084Part02368 = 71346053601425942218057389546416297510146880153638414932673972230153059398291808582261804342917902795177721856 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade084Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade084Part02432 = 36946165263078073264670109833024792255249244953497029166907155574624775233506422544701033372865587602803130368 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade084Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade084Part02496 = 21509672184310706852984907529368035246827155659966895300644464577437441697499323507013551604431780902741213184 := by decide +kernel

theorem group_length : firstCenterIntegerGrade084Group004.size = 512 := by
  simp only [firstCenterIntegerGrade084Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade084Group004 = 608406326371349246301844188097649523247418112007596925016506610657229748893268814470546408092262026068638040064 := by
  simp only [firstCenterIntegerGrade084Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade084Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
