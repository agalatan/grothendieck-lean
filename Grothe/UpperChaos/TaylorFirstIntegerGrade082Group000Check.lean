import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade082Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade082Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade082Part00000 = 3542103014766326621016574947273745906661537660667797218165698304248143565965616028139985352901135381493681487872 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade082Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade082Part00064 = 3548310270521382063858410445562397593413140963938095901959001630007379028971502783537325816233995599066525859840 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade082Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade082Part00128 = 3565714120403402430100911926451241535057261610194407751826993784890690315689807732248111179976011333527922540544 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade082Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade082Part00192 = 2732335370152233758883968593092267913972964444191340846404355781691641784541257058939902538592100703300642406400 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade082Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade082Part00256 = 923337245925954288448257568800691849773518564080967074808850786054395364689916606099059108719349353626082476032 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade082Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade082Part00320 = 3655146883847745982936676761954068543285693666018800408016659066544380210889747476924686378785366307835813560320 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade082Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade082Part00384 = 3509935497357795232307899087511692236470566347891669362228866208501492983305196134352108370117740098956084379648 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade082Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade082Part00448 = 3235368959604953402924435333724828237108838380698328846833645791498724776701048966885276129118512371450251313152 := by decide +kernel

theorem group_length : firstCenterIntegerGrade082Group000.size = 512 := by
  simp only [firstCenterIntegerGrade082Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade082Group000 = 24712251362579793780477134664370933815743521637681407410244071353436848030754092787126454874444211149257004023808 := by
  simp only [firstCenterIntegerGrade082Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade082Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
