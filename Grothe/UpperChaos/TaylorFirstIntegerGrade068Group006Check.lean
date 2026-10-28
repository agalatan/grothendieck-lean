import Grothe.UpperChaos.TaylorFirstIntegerGrade068Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade068Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade068Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade068Part03072 = 1840627242321801949217770573369397992774494620724035877864777858514164538424434350023830431559688880264314880 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade068Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade068Part03136 = 1200083983965529052807781739906829240164108342633504013196114827231350251144640043954403970887528076621643776 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade068Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade068Part03200 = 809965757632846265205342678741474156725302016636172528942027697161689524008303132133339470548320362191388672 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade068Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade068Part03264 = 663390923333642972901620608480678517144856712451009894131817365517542892952480828014306881542393568444809216 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade068Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade068Part03328 = 633820028199933266760713998797467642824788400794978092767138124617031719780846283341004205625830095926067200 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade068Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade068Part03392 = 591239924903808496513284324388459384243539349337708758538309086229167446204854000334140963614140096753696768 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade068Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade068Part03456 = 510903143617960015097523188574033099436577524081222762613717271821545679854829929313698490217248326101762048 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade068Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade068Part03520 = 427362082780166204541040723146659746350357211373234624368076236449457280779211813811964973931924442948042752 := by decide +kernel

theorem group_length : firstCenterIntegerGrade068Group006.size = 512 := by
  simp only [firstCenterIntegerGrade068Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade068Group006 = 6677393086755688223045077835404999779664024178031866552421978467541949333149600380926689387927073849251725312 := by
  simp only [firstCenterIntegerGrade068Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade068Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade068Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade068Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
