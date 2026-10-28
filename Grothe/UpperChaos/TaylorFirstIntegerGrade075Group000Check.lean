import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade075Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade075Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade075Part00000 = 4359206731445628569138645104989641376305998587745073728899564505595503658123230517532839651168667434142496980992 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade075Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade075Part00064 = 5633191481879885570138952066604419533765701863259058833826057438790277615602341472676435151030528334333231497216 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade075Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade075Part00128 = 7319712380886016383135872089946054315038715228753407061558379109105817952687705334428432012014478714140023062528 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade075Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade075Part00192 = 8197610424722243907939203008422827425167009593315391515200794883985110765888621826544682644918848909225138061312 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade075Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade075Part00256 = 8449860628936607122172492242053736982393184828938969250196690507012849909113990721554725651683301362676784955392 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade075Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade075Part00320 = 613568492383498436650388291158255445892350507167242507451533140438952092713058266666492038750479892763744665600 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade075Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade075Part00384 = 7633083096511922323097881570156986281164960666375388038054765288187178615846259881708119554642660935915957911552 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade075Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade075Part00448 = 7546133179524112626172269326545816824224720761530882903459608710163952756370969325042217685358170306132437893120 := by decide +kernel

theorem group_length : firstCenterIntegerGrade075Group000.size = 512 := by
  simp only [firstCenterIntegerGrade075Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade075Group000 = 49752366416289914938445703699877738183952642037085413838647393583279643366346177346153944389567135889329815027712 := by
  simp only [firstCenterIntegerGrade075Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade075Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
