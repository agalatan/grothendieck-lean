import Grothe.UpperChaos.TaylorFirstIntegerGrade088Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade088Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade088Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade088Part03072 = 4477739378140355904252897450313390635169590426151781122929423955077499739182601286728043453515096265850880 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade088Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade088Part03136 = 15739366127411760367588755721668148804816546393076008506299017396269216811582892450040722533947206257671667712 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade088Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade088Part03200 = 13118134126445808361320508042889230369051977805321026101865340854972285084243092703361054189496375462078709760 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade088Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade088Part03264 = 1336204591013079354683207586798461501031849962002035561665539751775074629972986169941359693828763487427362816 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade088Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade088Part03328 = 9486621883767408158012469580938330544153434251038495561741293761978349080040529385962326083900831083805016064 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade088Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade088Part03392 = 8777340731349135551505859842600329010582745530263183339440239479202503872665377673819007783892219393642332160 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade088Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade088Part03456 = 6971623976112165288589380092844525897277305088594972684066704814269304364995914916640639903751857521804967936 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade088Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade088Part03520 = 2957745048235064756603594969660411388882411171881599119008675506322489310609561087593949850656426956947456 := by decide +kernel

theorem group_length : firstCenterIntegerGrade088Group006.size = 512 := by
  simp only [firstCenterIntegerGrade088Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade088Group006 = 55436726920525732502361037360158999928937911031893755135320074157928133832550585462139432182121424729652854784 := by
  simp only [firstCenterIntegerGrade088Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade088Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
