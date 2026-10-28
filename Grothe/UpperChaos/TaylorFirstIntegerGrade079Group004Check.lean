import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade079Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade079Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade079Part02048 = 145638563735602982668296406278915003235634898593212741889128908952605374271679883459798391648139253872139960320 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade079Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade079Part02112 = 81122202124823084515790165152494788696683502664567361595199209401107536091053813576852657319152225997553664 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade079Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade079Part02176 = 119401600189529815694393205526994487007873105650390506806124619314624742309112407144124122106812718143072370688 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade079Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade079Part02240 = 97680009972921907761928965283648046279945722857672904777258607287624025762350742662919921280413103374523695104 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade079Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade079Part02304 = 79673623267984237886348648649337259413140959315418814643180942396373586561414187358434926819038529241386844160 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade079Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade079Part02368 = 43728041680766774051915044688832476199144587615446457146428984254047590442967157178778828324869300350957387776 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade079Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade079Part02432 = 21062123693669930313287972450511923795147712046513523969652954105980097827361701753022345960739984888016404480 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade079Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade079Part02496 = 52585938478439538235556501943377782470401569206920182467489633246298707180559529562432148595000634091759468544 := by decide +kernel

theorem group_length : firstCenterIntegerGrade079Group004.size = 512 := by
  simp only [firstCenterIntegerGrade079Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade079Group004 = 559851023221040009696242534986769473189985238788239699060859848766955231891536662933087537392332676187853684736 := by
  simp only [firstCenterIntegerGrade079Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade079Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
