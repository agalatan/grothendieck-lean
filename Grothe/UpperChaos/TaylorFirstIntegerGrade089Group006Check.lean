import Grothe.UpperChaos.TaylorFirstIntegerGrade089Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade089Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade089Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade089Part03072 = 18119272674228114810713492684163639345394744751913616482718177175177317169545644129317728243604489720689590272 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade089Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade089Part03136 = 15096580887661572844785229799116695411471661937825810710343401974478345048470013331311424566930385725774888960 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade089Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade089Part03200 = 5920535281647049910321173347160268906073945182029398866494464304869008788007505742328703204804983091363840 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade089Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade089Part03264 = 12592490763536307492264372418016894440820331232088123432165667760101810990970279915949134853651399246843215872 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade089Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade089Part03328 = 10456199906899247960650861612997377754260326816605815256397323367074055580411192301597988377768362382425325568 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade089Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade089Part03392 = 1098680795462461803866199241454862568270137645546032884327090678340063228740919941638246584758963578268024832 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade089Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade089Part03456 = 7465724989983227167007751562193208666911040265302518924072785136178368252550649722086325798184130908463824896 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade089Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade089Part03520 = 6875103040123756881075779756393649766079338460551929001867524915615001989514292954825448750787208598136029184 := by decide +kernel

theorem group_length : firstCenterIntegerGrade089Group006.size = 512 := by
  simp only [firstCenterIntegerGrade089Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade089Group006 = 71709973593176336010274008247683488222113655055015876090758465471269831268990999802468625878889745143692263424 := by
  simp only [firstCenterIntegerGrade089Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade089Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
