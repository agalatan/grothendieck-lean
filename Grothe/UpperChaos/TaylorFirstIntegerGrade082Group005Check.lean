import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade082Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade082Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade082Part02560 = 44573021762449491610507067251262441758603724087921009460226461578680124777054781138197939968798644445368025088 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade082Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade082Part02624 = 8210626060136793888784944239301382850185246183081087101030097337718169018473659599117228631280110181948588032 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade082Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade082Part02688 = 28449614163201322654059734830343670051543302666425624961042187231962454737437945181619251081991214861427671040 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade082Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade082Part02752 = 30026008622167222414615371206737132190104140879440680769865069973874314547917403602699910346986320193411612672 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade082Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade082Part02816 = 24487112392477188721950257681454847197594650634849753361327423921368918126522003085540848856221619055988047872 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade082Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade082Part02880 = 19455142728310165886929130122676452790993421394823039000245728979402594352403070651866227311899291398474563584 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade082Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade082Part02944 = 439128650193691984997838810921991009721417785764623655448483020449645727581757065212197813867958462989729792 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade082Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade082Part03008 = 16091843771313657484763562477039382056138159398449027081474969520578211545879939665566651461446118695719927808 := by decide +kernel

theorem group_length : firstCenterIntegerGrade082Group005.size = 512 := by
  simp only [firstCenterIntegerGrade082Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade082Group005 = 171732498150249534646607906619737299904884063030754845390660421564034432833270559989820255472491277295328165888 := by
  simp only [firstCenterIntegerGrade082Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade082Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
