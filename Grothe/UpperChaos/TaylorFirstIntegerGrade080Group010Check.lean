import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group010Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade080Group010Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade080Part05120.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade080Part05120 = 22607556704544372116135632551901559350144344912297993157982832068274686693528284729428417836687895675535360 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade080Part05184.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade080Part05184 = 10605233035442277472836539051245742303471866532740121124269875223303597490096258045043470920097697674297344 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade080Part05248.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade080Part05248 = 8038070273504297334255910237401168452464774859199290739811261556460006233011209012387924834858116287823872 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade080Part05312.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade080Part05312 = 17772335989752669357904303988630299751721943127604413642229210970312614657859125831397575557680505848594432 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade080Part05376.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade080Part05376 = 16990762489879691853535442224286393550660809335524465412199168855813672552365551863516685268746197016772608 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade080Part05440.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade080Part05440 = 17332997771669829235829039960736080214939796376572037089660689738857199361110434517117466570552739572482048 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade080Part05504.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade080Part05504 = 7323191704554711094426227742130684171156040474388862409040653005578411200448769624314859247234934437314560 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade080Part05568.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade080Part05568 = 13297514035089439310445364454466910062690902773419504496058664893531063396360597470710426748005059234103296 := by decide +kernel

theorem group_length : firstCenterIntegerGrade080Group010.size = 512 := by
  simp only [firstCenterIntegerGrade080Group010, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade080Group010 = 113967662004437287775368460210798837857250478391746688071252356312131251584780231093916826983863145746923520 := by
  simp only [firstCenterIntegerGrade080Group010, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade080Group010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group010Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group010Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
