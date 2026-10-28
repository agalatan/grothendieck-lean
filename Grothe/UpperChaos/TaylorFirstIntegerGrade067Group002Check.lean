import Grothe.UpperChaos.TaylorFirstIntegerGrade067Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade067Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade067Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade067Part01024 = 2671952478459445144749090180223001236403891732964420783247734916302528411286332477599834214059826694986101948416 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade067Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade067Part01088 = 2666035893953969435489746441773949640186317771416430565308134012428392278268632851791585537518444606299138162688 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade067Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade067Part01152 = 2514550265884275362198347461765549087460072572581267745911752669778243894662547903628305003246405846783588564992 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade067Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade067Part01216 = 2282938835778915011541299343863704162289302523809910138747505531708832583700064392321465057480331638705345265664 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade067Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade067Part01280 = 2000976947069202367891591791325922056848807967425726616322049739649137782019183969597438917474831837690410827776 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade067Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade067Part01344 = 1703375616930330133367181660130379280999126037013852952067392928608656442754682045323830653539743210262275031040 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade067Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade067Part01408 = 1417400179069505375760059634159669035035954751354747286431520922979760458402152964727564995704425666292429619200 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade067Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade067Part01472 = 1159185778808845609444856278104039903623684763275560231905377176259814646373660634545208357204601727460508172288 := by decide +kernel

theorem group_length : firstCenterIntegerGrade067Group002.size = 512 := by
  simp only [firstCenterIntegerGrade067Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade067Group002 = 16416415995954488440442172791346214402847158119841916319941467897715366497467257239535232736228611228479797592064 := by
  simp only [firstCenterIntegerGrade067Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade067Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade067Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade067Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
