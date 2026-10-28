import Grothe.UpperChaos.TaylorFirstIntegerGrade049Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade049Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade049Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade049Part02048 = 13931072571316495561224935495528848818891280560597694224880088507919860205138542623308018163009770728342945792 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade049Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade049Part02112 = 13545831177455369339964417479192070763690753101899178070933977832428364484208398060342956064696876928568655872 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade049Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade049Part02176 = 10436860043563581140964105018144115776214605126611210182244289921446795593231353183662783949543946201157599232 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade049Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade049Part02240 = 11819896877169237097665611720248647417187679203563265292104276056069598992002432089838385124951298548839743488 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade049Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade049Part02304 = 4652004972797463147549202744910120789720505489543227300413879097865321049678204816667039903403285655127588864 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade049Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade049Part02368 = 3075330793678037998663829348157740273727413736226000524750017640425352508541646724456849321934794879106285568 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade049Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade049Part02432 = 5642490251517142618858548498390637220241666852370202361640772781746616762491790135737020816157776597296873472 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade049Part02496.size = 54 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade049Part02496 = 4584363590589605351708180363823237553367955258933684007896939801362206196109348660011413646131055474149163008 := by decide +kernel

theorem group_length : firstCenterIntegerGrade049Group004.size = 502 := by
  simp only [firstCenterIntegerGrade049Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade049Group004 = 67687850278086932256598830668395418613041859329744461964864241639264115791401716294024466989828805012588855296 := by
  simp only [firstCenterIntegerGrade049Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade049Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade049Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade049Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
