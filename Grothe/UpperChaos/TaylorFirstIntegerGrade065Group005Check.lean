import Grothe.UpperChaos.TaylorFirstIntegerGrade065Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade065Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade065Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade065Part02560 = 14232870330814537478590202191089806040663085152246118693596735044418458529517965128355858160219605782663004160 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade065Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade065Part02624 = 9777453008703654455776430301012476918557945067326215855600435270380247277386530883564693357776988980723580928 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade065Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade065Part02688 = 6650359159541637191351435202310079900637274631301979240694344867871338764605198535232672682002736450023456768 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade065Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade065Part02752 = 3105160374222757066117000073702704312624923982498578285097314506821592275852726483509133266459204825447923712 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade065Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade065Part02816 = 2311995814018948626532891255109473311929164684584075421384650257150290470702383767221007840750921605877596160 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade065Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade065Part02880 = 2127903013755792055159250171088175295333777873671063585585243570856726984447949634891092769826310471771226112 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade065Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade065Part02944 = 2122427930351977210429947176899855666126439640559457144702633377485434474420714330997285196172993678079426560 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade065Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade065Part03008 = 1702329980183377305985345756029622896081319757088650975497383380110542715964128485536003663065622166441558016 := by decide +kernel

theorem group_length : firstCenterIntegerGrade065Group005.size = 512 := by
  simp only [firstCenterIntegerGrade065Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade065Group005 = 42030499611592681389942502127242194341953930789276139202158740275094631492897597249307746936274383961027772416 := by
  simp only [firstCenterIntegerGrade065Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade065Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade065Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade065Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
