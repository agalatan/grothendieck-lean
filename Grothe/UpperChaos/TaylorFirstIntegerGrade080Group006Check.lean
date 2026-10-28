import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade080Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade080Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade080Part03072 = 11058373625670330094460592700063597724646242646457250036462693111323451156556748048123367242447662305607942144 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade080Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade080Part03136 = 5450851508794380116100087282913628831576395692700943831066790565657556280224438466636318132467687507286294528 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade080Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade080Part03200 = 2992839380796468607957436035504042670284378656524106329154721252524298077711223535970495948146966007117774848 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade080Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade080Part03264 = 6291691051708851717983859232485388909311558843829220843382853077329006477299062075792634076472410004424491008 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade080Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade080Part03328 = 4606988041425866610620676022236287379580151627515694889429410462444640568416033255640919011557126140009119744 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade080Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade080Part03392 = 3326452675522282865454888286731941078672147812310001415923206790288538608497811727893547437151865801726230528 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade080Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade080Part03456 = 17570424390005933734577912293229671701463828030312825892705543694133524853059936199908930059839344629252096 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade080Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade080Part03520 = 2349698176203788731298149952855103148978599456771233825018005470131546899266667990420387686663048563531972608 := by decide +kernel

theorem group_length : firstCenterIntegerGrade080Group006.size = 512 := by
  simp only [firstCenterIntegerGrade080Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade080Group006 = 36094464884511974677610267425083219414750938564138763996330386273393171592825045036677578464966605674333077504 := by
  simp only [firstCenterIntegerGrade080Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade080Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
