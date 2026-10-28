import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade071Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade071Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade071Part02560 = 77199782287558714488225952899428391758958530952423568321105125496674539985520689561751224450379406995619840 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade071Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade071Part02624 = 28358039328380111613611554204546338117036720120566610405313329386670338932325226887902196205422043796942618624 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade071Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade071Part02688 = 21347234648708085851292975609808430432114746048572899112810527934661203423271171404321539701993983109446500352 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade071Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade071Part02752 = 15635453167187753446086175247385273854891626317881749127396512036707067170606046945440498451863507437206110208 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade071Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade071Part02816 = 11198005889016897101198822941659079718382527476845633637809057831958972281010398133175439413011396030407639040 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade071Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade071Part02880 = 7896886208441048972049316799307654824892207962181968984190246515372421943207125099447439912454461458137219072 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade071Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade071Part02944 = 5493061827238433476745613453568672918451360795778184814203633787370347782601010838544354184087981734085263360 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade071Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade071Part03008 = 3740576145533256464188735504926456939453481658349701867935503554680489816778039986620433813056181868567724032 := by decide +kernel

theorem group_length : firstCenterIntegerGrade071Group005.size = 512 := by
  simp only [firstCenterIntegerGrade071Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade071Group005 = 93746456996793145639661419714101335196981628911129171517979916172917515889784539985013652906339934841788694528 := by
  simp only [firstCenterIntegerGrade071Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade071Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
