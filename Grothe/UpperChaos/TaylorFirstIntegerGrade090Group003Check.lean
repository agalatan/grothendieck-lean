import Grothe.UpperChaos.TaylorFirstIntegerGrade090Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade090Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade090Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade090Part01536 = 269442478580095163436651175202261415715486091539833382196256100618847701944797599842126632652823569316339253248 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade090Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade090Part01600 = 244347389776903231713962114608177944406362638846089672449110287791504407938797660479390775598286152478087970816 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade090Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade090Part01664 = 3240976916707239553923922282385549093638659392295705163372332896436766923154990719624772487347977467266596864 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade090Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade090Part01728 = 227179826354740813211706874829110614237347618935602436526826390969462485632950068480868280304130042538051502080 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade090Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade090Part01792 = 204761408493012531701741547242764811399538358081171396883779929451752308807146015541838192294073479081062563840 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade090Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade090Part01856 = 467437579931337302107599193042856743655111112487702883593512239590957676249389674450337924868816052366082048 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade090Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade090Part01920 = 179835568010841554971803732472105730324923038679549117280783434317348671724562010970603537586795694948660281344 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade090Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade090Part01984 = 155420844376158939289484439293116192036198339729043040996243695461456371308534913633066878749405932916819623936 := by decide +kernel

theorem group_length : firstCenterIntegerGrade090Group003.size = 512 := by
  simp only [firstCenterIntegerGrade090Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade090Group003 = 1284695930088390811181381405122965113957149856316072454379965683746399671956192649341969407597731664798653874176 := by
  simp only [firstCenterIntegerGrade090Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade090Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
