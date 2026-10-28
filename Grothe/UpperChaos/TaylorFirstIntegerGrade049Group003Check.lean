import Grothe.UpperChaos.TaylorFirstIntegerGrade049Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade049Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade049Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade049Part01536 = 139196808556862019751231159247585014759440200279870343777579544408408604700555790097974421915425582449455792128 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade049Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade049Part01600 = 115294184051495414342242127102310401177155274063073846507728147261924780056902064475516768944738113854734598144 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade049Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade049Part01664 = 117138888684075354159363973580535948340744429502862535481001035161069519267571325720996759875462157274431094784 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade049Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade049Part01728 = 197559482013150799934587195779026076321260623328241879589101284812032274220694416568342690027593734764875481088 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade049Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade049Part01792 = 61432542733420070361183730059741695284296365175685378736404063934518205913233683564461163074125744926028201984 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade049Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade049Part01856 = 31366783386388282143847616144479715133285999344739987205336251146575929318364586497390199741148064755161759744 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade049Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade049Part01920 = 15027762372158910041945532473812364171412536477128331457683174965129269217159500070098492174556018848152158208 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade049Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade049Part01984 = 15237585301038620135982594771188896472370943765256352720560956878959695015595741596205601172353074025379921920 := by decide +kernel

theorem group_length : firstCenterIntegerGrade049Group003.size = 512 := by
  simp only [firstCenterIntegerGrade049Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade049Group003 = 692254037098589470870383929158680111659966371936858655475394458568618277710077108590986096925402490898219008000 := by
  simp only [firstCenterIntegerGrade049Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade049Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade049Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade049Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
