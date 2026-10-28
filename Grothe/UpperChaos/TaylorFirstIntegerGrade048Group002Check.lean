import Grothe.UpperChaos.TaylorFirstIntegerGrade048Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade048Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade048Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade048Part01024 = 2689764157224987920693555354379288102540566408071529217558661896027252490083454226161786761150501194690587525120 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade048Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade048Part01088 = 3347383566918614657433322880996304469470589536110949689706216523147203146279045288395585988897255016476675407872 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade048Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade048Part01152 = 1231573538929214796461923611184097583593212852553928195500759555193909905674142278771583942288004359171147300864 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade048Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade048Part01216 = 894457778459990926749467424887415798496552513914142798774612284614556466245342751741146118538046918972214870016 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade048Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade048Part01280 = 733067425673497336789312388185446288496852177784902837814507178295549862762377623751774828124503436076586631168 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade048Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade048Part01344 = 883210485368187834811411790866718210846020315917896894898941425104166194259468833726786846284949774396603498496 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade048Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade048Part01408 = 243788932465031022500527220182587099480310627556421823604843349865623578004495906068446036848511433751700439040 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade048Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade048Part01472 = 162114206904356253230714966885769249586319027780682746877955396191965806323283808897469037439313391574092611584 := by decide +kernel

theorem group_length : firstCenterIntegerGrade048Group002.size = 512 := by
  simp only [firstCenterIntegerGrade048Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade048Group002 = 10185360091943880748670235637567626802510423459690454204736497608440227449631610717514579559571085525109608284160 := by
  simp only [firstCenterIntegerGrade048Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade048Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade048Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade048Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
