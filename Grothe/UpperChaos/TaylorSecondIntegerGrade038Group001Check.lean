import Grothe.UpperChaos.TaylorSecondIntegerGrade038Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade038Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade038Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade038Part00512 = 55057850973534188753739574733253303744927779252834304716001438233813822289225700687448993151698576732976054272 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade038Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade038Part00576 = 63171535550392202955776180716405588552219163814209377383364076397168042613171448122498588174236703074226798592 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade038Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade038Part00640 = 22691669785298786003937960762104457195150425236732721220241601684019601570046081117005625835765590410599071744 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade038Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade038Part00704 = 26884475282255807352666866348302889065610719160597486215404422170440577950143499549282956062577616478447599616 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade038Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade038Part00768 = 22158018442241521501811226837689319063317204797828855993242609065170646582000194474075920740726960047832170496 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade038Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade038Part00832 = 12045147393576458832918322613122054945796412649043679761098333292879797591745902380672768565551431251375685632 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade038Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade038Part00896 = 10143864318941786639273991583066089117358963840886061859271485620277079256595087963414663824179207788788973568 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade038Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade038Part00960 = 4633950446951419706342497394982900496362288281500757767876276274959430271612403934493789135459749772075728896 := by decide +kernel

theorem group_length : secondCenterIntegerGrade038Group001.size = 512 := by
  simp only [secondCenterIntegerGrade038Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade038Group001 = 216786512193192171746466620988926602180742957033633244916500242738728998124540318228893305490195835556322082816 := by
  simp only [secondCenterIntegerGrade038Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade038Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade038Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade038Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
