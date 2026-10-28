import Grothe.UpperChaos.TaylorFirstIntegerGrade044Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade044Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade044Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade044Part00000 = 507838397565419750106623700542517918264545638008169887176977823813290961846006505650837310265214115281846954622976 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade044Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade044Part00064 = 521175217522214517248945826657532261019944527004429996571704465151749795824281419932198184109719219281680970809344 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade044Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade044Part00128 = 1245188916900578256346453106606998473237021495138984205763464346335801672442690654311775148192234133467924866793472 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade044Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade044Part00192 = 639158999657104483244001529997705311485666172763377922640773079496060394123976645465021267635742708821557271068672 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade044Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade044Part00256 = 783251201329056802056523567167647049445964297272967297155549563818171868853845416106820062012930958169274230767616 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade044Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade044Part00320 = 481489222278929725040833468176240257243920582005439501281903897813378428428394580846713479235782936305522278662144 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade044Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade044Part00384 = 157715785728395328644277857711630112319053309432870619039208666767832829784301070464956914954561758893866309648384 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade044Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade044Part00448 = 154633032150497616183373089338654794676511622799292908819537598708306012938336335174516660155907987464778418225152 := by decide +kernel

theorem group_length : firstCenterIntegerGrade044Group000.size = 512 := by
  simp only [firstCenterIntegerGrade044Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade044Group000 = 4490450773132196478871032146198926177692627644425532338449119441904591964241832627952839026562093817686451300597760 := by
  simp only [firstCenterIntegerGrade044Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade044Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade044Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade044Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
