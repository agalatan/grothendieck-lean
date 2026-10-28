import Grothe.UpperChaos.TaylorFirstIntegerGrade086Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade086Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade086Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade086Part02048 = 35065237861979847312176486835491237469752324405100134521116905690036834948354449925572544541457417633011859456 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade086Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade086Part02112 = 102459694506920509538519951833877870718315034870996119956307189309066155268477337909539254275853963031532797952 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade086Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade086Part02176 = 114992069120725294825977367211671973577886522233373450819777305985522666606735920144322991448775801176433098752 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade086Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade086Part02240 = 95614477622620109427070851546472924163880830755629332662183206163057626455849709395055403643032636667465826304 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade086Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade086Part02304 = 134919295919010910644696936797235287182439019342440724630461443487607900192081034915442376600855291476574208 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade086Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade086Part02368 = 78918294970919229419718999735018312121298036298626087329066020724614902776745690056386026159988640965829066752 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade086Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade086Part02432 = 65026799710153468615392646680361834291751635948073979189783329922783677425043080895150760949652839951583150080 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade086Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade086Part02496 = 53313504542441019437028990449218235062362430007466388361004515957969334852804799362358404806596381595270119424 := by decide +kernel

theorem group_length : firstCenterIntegerGrade086Group004.size = 512 := by
  simp only [firstCenterIntegerGrade086Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade086Group004 = 545524997631678489486529991228909622692429253538607933563868935196538806234203068723300828201958536312602492928 := by
  simp only [firstCenterIntegerGrade086Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade086Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
