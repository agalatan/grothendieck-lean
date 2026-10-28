import Grothe.UpperChaos.TaylorFirstIntegerGrade084Group012Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade084Group012Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade084Part06144.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade084Part06144 = 14938515852202382195450139987074706087529427115622111876241398335040939988731899734814974974088052190740480 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade084Part06208.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade084Part06208 = 7553454873609103062498149368078685738476416289447592674169337048797468057018308412292087054085077675802624 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade084Part06272.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade084Part06272 = 8136855148033184134527123656712812989540257388561712854566118494257884924244238889839982416473488946626560 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade084Part06336.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade084Part06336 = 15943146429963555703533975914400018006274046741230778336575913068477700044692237891211565199430286351269888 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade084Part06400.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade084Part06400 = 17313635649410560016491049723032978965493063503904723429003578125920312218109510817145555114526208121896960 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade084Part06464.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade084Part06464 = 3790254267428034985988393027651946635652961146816333597482535617639896293815017145374120698270555779891200 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade084Part06528.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade084Part06528 = 9170918658078539695628480915611441654737288891605461988475818907785307023631927517713412010165369707692032 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade084Part06592.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade084Part06592 = 11639460681496514653829670589490289824932172301027053139252971005261695320801413889786231614885959821164544 := by decide +kernel

theorem group_length : firstCenterIntegerGrade084Group012.size = 512 := by
  simp only [firstCenterIntegerGrade084Group012, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade084Group012 = 88486241560221874447946983182052879902635633378215767895767670603181203871044554298177929081924998595084288 := by
  simp only [firstCenterIntegerGrade084Group012, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade084Group012Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group012Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group012Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
