import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade071Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade071Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade071Part01536 = 85773099188239835242765706985195292448374810062713949025709019823328035809343087378538027761254937921098612736 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade071Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade071Part01600 = 692753884602032140562808320953388023908930589012906044084182576714685958721016301055928982193212745536117932032 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade071Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade071Part01664 = 571749905626973826235361157734333958365169585064154320581819706164133058594597069709689189028182385280424083456 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade071Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade071Part01728 = 462209744419256296069869330401839522426682526658481880203441532709814482371272114523582126613391801769221160960 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade071Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade071Part01792 = 371280336796727290887505047973642890666170147990226443363593626929393632143119780093010745040312127571615547392 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade071Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade071Part01856 = 297450672093703910737934997942591635016103846589913825220174146488051461193716301075402231634268776251017658368 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade071Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade071Part01920 = 238137394030599126464900413702599173686585222993324296813767102302703861182845024439928482339813867142806241280 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade071Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade071Part01984 = 190375289201617797671645254530045052340133674892525532624108989697406961255623565170865900412859748925149544448 := by decide +kernel

theorem group_length : firstCenterIntegerGrade071Group003.size = 512 := by
  simp only [firstCenterIntegerGrade071Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade071Group003 = 2909730325959150223872790230223635548858150403264246291916796700829517451271533243446945685023296390397450780672 := by
  simp only [firstCenterIntegerGrade071Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade071Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
