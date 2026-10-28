import Grothe.UpperChaos.TaylorFirstIntegerGrade061Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade061Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade061Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade061Part00000 = 46701352005185236395502540175180408574484275282299267923332933320535448646699449601830750200784872117682349015040 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade061Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade061Part00064 = 103398631049585160899166921890603920900966031532370254628829460436626438103116233887721031922253492631795887243264 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade061Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade061Part00128 = 104077602406440738837955431119200683714481701804056713826782660342010596204815217530048638295746988392171318542336 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade061Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade061Part00192 = 130414952679113162515766547045133616659566418895409443915005162649079856245395759297393491101421105883651319529472 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade061Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade061Part00256 = 90343191287456272804869398867438195876091978287470638869602258246709423526939142766080438365957505006272052723712 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade061Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade061Part00320 = 73085613104628316327841731284089174993015698205940648527816730443819829531385497032159497293973632160127265013760 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade061Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade061Part00384 = 56710320340874282569573177099304675675132791156078918287716855408838896313601631408016758474001040879262204166144 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade061Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade061Part00448 = 40431396317372301746531800340663035259840620819474934947918189833464785754841245541411423841224226701896283324416 := by decide +kernel

theorem group_length : firstCenterIntegerGrade061Group000.size = 512 := by
  simp only [firstCenterIntegerGrade061Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade061Group000 = 645163059190655472097207547821613711653579515983100820927004250681085274326794177064662029495362863772858679558144 := by
  simp only [firstCenterIntegerGrade061Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade061Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade061Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade061Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
