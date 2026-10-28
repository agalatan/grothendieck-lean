import Grothe.UpperChaos.TaylorFirstIntegerGrade053Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade053Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade053Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade053Part02048 = 41469606192737333280243974748989766324169459284178370085477582539480814206119923955970988192247393307435466752 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade053Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade053Part02112 = 30067806790592740869483714667666427895695192156120706755855188631315230267069599769212121775533701149004660736 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade053Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade053Part02176 = 17772611151926908460344165544841045810946666912663942389365509721305017472856321737570203101793938228622917632 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade053Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade053Part02240 = 9492251920787743982992211249965617867782679962780794835843564421358988610534338620133188552675693964013076480 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade053Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade053Part02304 = 9569726020722542939448157824669700362377784638171501249156647278109479672467290974826180393656516764430761984 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade053Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade053Part02368 = 6210571912798071728379298359413219333495322135021074165946483017605305406946275429345309219361447631044739072 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade053Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade053Part02432 = 6519323126497330909765443970482948674591601528889505106531966614318617753500347334856696418053223018435444736 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade053Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade053Part02496 = 5606914135475427871179154125640595581100036424810255871834534626210746516078034556731689706965873432977211392 := by decide +kernel

theorem group_length : firstCenterIntegerGrade053Group004.size = 512 := by
  simp only [firstCenterIntegerGrade053Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade053Group004 = 126708811251538100041836120491669321850158743042636150460011476849704199905572132378646377360287787495964278784 := by
  simp only [firstCenterIntegerGrade053Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade053Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade053Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade053Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
