import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group012Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade080Group012Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade080Part06144.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade080Part06144 = 1812120267622177236773544359722803837905376079590859726480848966818582476123062152027132410331291357020160 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade080Part06208.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade080Part06208 = 11352766629022817945654345820386155980160989786283262097309974252786574486394448030169531275696950596337664 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade080Part06272.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade080Part06272 = 20930574487205562270275493141155134720536750825695715596270920220253907818196947394201424241830512824418304 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade080Part06336.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade080Part06336 = 24278518930742419059784512513520235937444464405450304364648002221185462654982180916558373752875594035494912 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade080Part06400.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade080Part06400 = 1060749587908034116780493158705464971307406155047166580555047819371329795299495314992726277818902114205696 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade080Part06464.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade080Part06464 = 14755711635855586111030173011713721079409734308216996593151345732833141865500785840778044473417468771041280 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade080Part06528.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade080Part06528 = 7369859815834198854025463135986360572585126399798069993801955214883994713956061636368902275375366894780416 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade080Part06592.size = 50 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade080Part06592 = 3029044785374898727852469601665489037726683930704269619060493625387986372474599077364303301741886121705472 := by decide +kernel

theorem group_length : firstCenterIntegerGrade080Group012.size = 498 := by
  simp only [firstCenterIntegerGrade080Group012, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade080Group012 = 84589346139565694322176494742855366137076531890786644571278588053520980182927580362460438009087972715003904 := by
  simp only [firstCenterIntegerGrade080Group012, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade080Group012Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group012Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group012Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
