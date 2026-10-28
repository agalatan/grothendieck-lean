import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade081Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade081Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade081Part04608 = 72661424162937153922547373648615190039480267379844181444465217229317646971817210316779156809539334258556928 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade081Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade081Part04672 = 56518439444430416227279697451109115124763482193562732684240220904894701912924728737103581702415758980546560 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade081Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade081Part04736 = 5587221493648119946138809892275868217773240932356911118370212130536803160112839506026541015370099140329472 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade081Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade081Part04800 = 51005137297203969734257167682911029570577426010499162249872369891719309597879704356310305790367390890983424 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade081Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade081Part04864 = 42209977317529144959888719417367097067026114539515114318252056170203590201078253966075794542079411541245952 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade081Part04928.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade081Part04928 = 33816996885145917005503012356315845505240486364082172691175843382985394934725642517364995693186816455737344 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade081Part04992.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade081Part04992 = 6890674646896460227295614443467877807488042710972675667574236636140335365531947397953735954957403869413376 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade081Part05056.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade081Part05056 = 22801459401963207442935479691348784022752614035442984066190212959403208980903289442428899913541542467338240 := by decide +kernel

theorem group_length : firstCenterIntegerGrade081Group009.size = 512 := by
  simp only [firstCenterIntegerGrade081Group009, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade081Group009 = 291491330649754389465845874583410807355101674166275934240140369305200991124973616240043011421457757604151296 := by
  simp only [firstCenterIntegerGrade081Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade081Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
