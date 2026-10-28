import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade071Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade071Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade071Part02048 = 654655889056607666002835580578571403129452926579498461054209037816151510038882110617923808851692413297623040 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade071Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade071Part02112 = 151747526637987094929247131130461743705301296071935034680395227702695727421384247147078058266503739377979490304 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade071Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade071Part02176 = 121328992838765331593824511598717033702181477729798878335665738358172204917451179386648058700531592842834870272 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade071Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade071Part02240 = 96449689174356277953329954456035610451783034814990067839068343027675021797172350914488962456005706141222830080 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade071Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade071Part02304 = 76468823328212173181187362839015637470123930405192696620339224981443291031958859093075699249455124542258151424 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade071Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade071Part02368 = 60431651736388925090254728839124971537109667132608726315848999404551852064689631389524856026748931111611531264 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade071Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade071Part02432 = 47513757576121168748640683082310935717333305567949630570756078030862723535642874502791916925941718986157719552 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade071Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade071Part02496 = 37014747433258637255099508276505740751910583940724984225584111986453385123018125813818491908228793293640564736 := by decide +kernel

theorem group_length : firstCenterIntegerGrade071Group004.size = 512 := by
  simp only [firstCenterIntegerGrade071Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade071Group004 = 591609844614146216417586715802750244738872748589779517048711932529670357401356150358043967342267298709002780672 := by
  simp only [firstCenterIntegerGrade071Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade071Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
