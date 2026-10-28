import Grothe.UpperChaos.TaylorFirstIntegerGrade063Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade063Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade063Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade063Part00000 = 26822003806900381901934439417042185995541830372505233279570457463432159879074808891559292889989310455668996571136 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade063Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade063Part00064 = 43624207895355072473814506294100407420396796827850286206275764029755609373892666548705954465376529881861548146688 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade063Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade063Part00128 = 59462654415582533728343751256630737101904086347809252734372899919721667349385233921256763078906186852477727408128 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade063Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade063Part00192 = 68572794394731065071843916582182838283957498594136055137801628396810521608748990807420397622609485670301206315008 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade063Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade063Part00256 = 69436879971060207069619762315708646765098554578246927474967997346133337788648121202023529719295763503806974787584 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade063Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade063Part00320 = 63801286701031647481113589320589649336883071016726902832956845713125868333540002491633964627862611695055256158208 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade063Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade063Part00384 = 53519327144503212798574682409341868194288329047017710877389462786249735815749685329482737570340668970278074712064 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade063Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade063Part00448 = 41330507255871232805569165160660552949555773827525151443282331608816739335120022625569640788051624525834301210624 := by decide +kernel

theorem group_length : firstCenterIntegerGrade063Group000.size = 512 := by
  simp only [firstCenterIntegerGrade063Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade063Group000 = 426569661585035353330813812756256886047625940611817519986617387264045639484159531817652280762432181555284085309440 := by
  simp only [firstCenterIntegerGrade063Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade063Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade063Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade063Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
