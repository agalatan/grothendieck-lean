import Grothe.UpperChaos.TaylorFirstIntegerGrade012Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade012Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade012Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade012Part00000 = 25908424576096131013700619139821571786579605562082521856957849915587598066122886474663212689463995805265070043168768 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade012Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade012Part00064 = 1021748513812392797023660854483169625466793946512964960259839207195926968338084292793880661853759627480108158156800 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade012Part00128.size = 54 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade012Part00128 = 13642376171208504033186664321230687202557761549761031452329875689581027631543317799576749969864702127756982353920 := by decide +kernel

theorem group_length : firstCenterIntegerGrade012Group000.size = 182 := by
  simp only [firstCenterIntegerGrade012Group000, Array.size_append, len0, len1, len2]

theorem group_energy : energy firstCenterIntegerGrade012Group000 = 26943815466079732314757466658625972099248957270145247848670018998473106062092514085256670101287620134872935183679488 := by
  simp only [firstCenterIntegerGrade012Group000, energy_append, sum0, sum1, sum2]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade012Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade012Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade012Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
