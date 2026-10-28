import Grothe.UpperChaos.TaylorFirstIntegerGrade050Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade050Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade050Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade050Part00000 = 217325006143862618882246403364750157688804403717479845362897661843736640000258422241321957441881151621607280607232 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade050Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade050Part00064 = 133450170397313254758210731433965601770593368805297999115266580090729802795307426570404512370098083925686183002112 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade050Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade050Part00128 = 79355123518142280115329657137796304414497433576249733559279525253679044386683908909168057941587931536957963763712 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade050Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade050Part00192 = 72173656092903328314102506168754478207512618566790911124667183252913294059124805085497641338272162028596561444864 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade050Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade050Part00256 = 231158550003488192597302156870558091207743479453147820336050019567408339745494137546298952880217317136118325444608 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade050Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade050Part00320 = 157762605093122108412065089368387479423783852906432134944261989686759881941518657478077342945805910003048324792320 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade050Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade050Part00384 = 140591859207428671001173913956314812824239557652247432133894812377553939229367520380646876537403571006986254286848 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade050Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade050Part00448 = 118766209693078799826965332814443021604071305894108008944265552284397603010773887370554745476779028120600844435456 := by decide +kernel

theorem group_length : firstCenterIntegerGrade050Group000.size = 512 := by
  simp only [firstCenterIntegerGrade050Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade050Group000 = 1150583180149339253907395791114969947141246020571753885520583324357178545168528765581970086932045155379601737777152 := by
  simp only [firstCenterIntegerGrade050Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade050Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade050Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade050Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
