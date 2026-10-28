import Grothe.UpperChaos.TaylorFirstIntegerGrade086Group012Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade086Group012Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade086Part06144.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade086Part06144 = 12101436442568901580445042613814666418724814652154787444634951305915893525949410021110850073693931618435072 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade086Part06208.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade086Part06208 = 12798490794540936059985459949789165472853407065040257182464017479057527742409936337036878353363070527471616 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade086Part06272.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade086Part06272 = 6696047042237723643612248518645681313597037350891121575705988501823055608741076997150986211526077164027904 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade086Part06336.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade086Part06336 = 5848739285763215891865843721613748191021051271298620232698903171866597800126569743037942954194035451887616 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade086Part06400.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade086Part06400 = 13721297974007678990063730674501875861568766157444338334935644340925122418770908275696167628666136556470272 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade086Part06464.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade086Part06464 = 13547163571219456657938042930801648780098417321247865002334940257832001391662837647600347092451260102606848 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade086Part06528.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade086Part06528 = 2951472577407220410964060111130759526556220776846347529353827474648394403771475361898982184096513442971648 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade086Part06592.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade086Part06592 = 11352822801798796216236786189425446121701757490225463789690782284535968623444454089248594001397722044694528 := by decide +kernel

theorem group_length : firstCenterIntegerGrade086Group012.size = 512 := by
  simp only [firstCenterIntegerGrade086Group012, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade086Group012 = 79017470489543929451111214709722991686121472085148801091819054816604561514876668472780748499388746908565504 := by
  simp only [firstCenterIntegerGrade086Group012, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade086Group012Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group012Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group012Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
