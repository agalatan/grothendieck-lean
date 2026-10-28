import Grothe.UpperChaos.TaylorFirstIntegerGrade019Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade019Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade019Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade019Part00000 = 6784554721847613879969892265201018416741684061261836094623717060935170497174757664798140971502051922853227925602304 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade019Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade019Part00064 = 2117374139644980252910715364850557600608742286698438777817491221180321811297716999398776432446463317498576674750464 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade019Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade019Part00128 = 250339688214816859288243972176934460069038431976818418713277878254285926386096847413565220285960018104978512019456 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade019Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade019Part00192 = 15806822751011174020629237389179153604717466378934134776932109251147944825754411653077803373076878283806127161344 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade019Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade019Part00256 = 4754608200604992663204627510982051225773560800685141584808807835502495139567537868302955810501471283508892663808 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade019Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade019Part00320 = 2895429594100137885468560998470281750152706213286285047239304802036246753628908838117640150515085786885558108160 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade019Part00384.size = 36 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade019Part00384 = 1124436153419752697779407601374187391946441769005039065328365835261302420823711822844624816388296603826649038848 := by decide +kernel

theorem group_length : firstCenterIntegerGrade019Group000.size = 420 := by
  simp only [firstCenterIntegerGrade019Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6]

theorem group_energy : energy firstCenterIntegerGrade019Group000 = 9176849846406547049435933435728516151392054955099003891628794748093726223998346081792825648384956990414810339344384 := by
  simp only [firstCenterIntegerGrade019Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade019Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade019Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade019Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
