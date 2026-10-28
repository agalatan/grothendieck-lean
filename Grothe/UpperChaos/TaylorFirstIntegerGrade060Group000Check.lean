import Grothe.UpperChaos.TaylorFirstIntegerGrade060Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade060Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade060Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade060Part00000 = 84489007476737422579593027176971907727306072559884767955646836429476165184213903793990739667372925542150023675904 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade060Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade060Part00064 = 136457230760858747233646596154923381766581474472472141814869647187259163195701374109284590523345277650608634986496 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade060Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade060Part00128 = 124221474779246775405607603216412296079396085842173957890419005783829230205873096226557662747133835482231860101120 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade060Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade060Part00192 = 117401912628597578488223128311890192147401637984201114645069970442185808280215975087589392146122052903445209284608 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade060Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade060Part00256 = 101876451387306194346182386636913304668064322395697136208042081412933903974649479310952635291372140631007925633024 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade060Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade060Part00320 = 83222998104493177903859928111056298512447402707904513401078280897851228745771572974490613948968897389593075122176 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade060Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade060Part00384 = 63398251521534806872088044688465654109753064500959741979435261160553278679272891673352340488817881919364689559552 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade060Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade060Part00448 = 45563462096681344578868654891124689504679807879900906712528465213441888417651324438680995380176536532829132029952 := by decide +kernel

theorem group_length : firstCenterIntegerGrade060Group000.size = 512 := by
  simp only [firstCenterIntegerGrade060Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade060Group000 = 756630788755456047408069369187757724515629868343194280607089548527530666683349617614898970193309548051230550392832 := by
  simp only [firstCenterIntegerGrade060Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade060Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade060Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade060Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
