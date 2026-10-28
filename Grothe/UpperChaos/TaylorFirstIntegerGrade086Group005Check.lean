import Grothe.UpperChaos.TaylorFirstIntegerGrade086Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade086Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade086Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade086Part02560 = 8033195109262160407746355313208049443573067760723125423629489207143988619248717657547375022567747340992512 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade086Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade086Part02624 = 43715748445154957288533798573185312077883231181149104261903963712925629051794564752653865249931439003811184640 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade086Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade086Part02688 = 35966058322733682131998043980863097190043005119093952406909392421325816352874269638798300999441404705059635200 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade086Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade086Part02752 = 6134072498435294884431235569569849555563284796594366426300098331936829510745545604733213297670528004847042560 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade086Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade086Part02816 = 23631303224777647273501213848904507731380350198917985737007565680105415263181027618140652484840975425729462272 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade086Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade086Part02880 = 24771990557242333538286083170205425984601495763043219553784542517498636908312010405126566065435636958792515584 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade086Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade086Part02944 = 20658358966135583472856068562909826093389670162411254136091590209715845814703775382556568536054469642690756608 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade086Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade086Part03008 = 29612121168890788969539264025923355303752351649355208290563977940369296173093902899730198980747735980834816 := by decide +kernel

theorem group_length : firstCenterIntegerGrade086Group005.size = 512 := by
  simp only [firstCenterIntegerGrade086Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade086Group005 = 154915177330757651538983729324977150037608362640619960855711346340655686186403536022566444207377769224252424192 := by
  simp only [firstCenterIntegerGrade086Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade086Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
