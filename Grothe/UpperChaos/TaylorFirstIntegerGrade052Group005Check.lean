import Grothe.UpperChaos.TaylorFirstIntegerGrade052Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade052Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade052Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade052Part02560 = 2805172682409070901617331484564065040004697718372945029765231270660485464000369647586337957943049912173199360 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade052Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade052Part02624 = 2526090216235983809464707857415620432462754321225519121171798244503363775505990704777099871591439344345284608 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade052Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade052Part02688 = 2389961045474774675375021067288065931176930133872060904128897822801798755990150947335548780492706192889479168 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade052Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade052Part02752 = 2061408294436404558628151829106131667840247661486203669720564364504232291165012614166145847147557476546641920 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade052Part02816.size = 46 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade052Part02816 = 2242313157899689328053688210831825473033741730816515107779628220390064560308865511091579664789658160351674368 := by decide +kernel

theorem group_length : firstCenterIntegerGrade052Group005.size = 302 := by
  simp only [firstCenterIntegerGrade052Group005, Array.size_append, len0, len1, len2, len3, len4]

theorem group_energy : energy firstCenterIntegerGrade052Group005 = 12024945396455923273138900449205708544518371565773243832566119922859944846970389424956712121964411086306279424 := by
  simp only [firstCenterIntegerGrade052Group005, energy_append, sum0, sum1, sum2, sum3, sum4]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade052Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade052Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade052Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
