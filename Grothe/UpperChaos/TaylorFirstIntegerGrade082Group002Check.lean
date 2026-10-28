import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade082Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade082Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade082Part01024 = 439241945139577863210595510110116454488371626551397510032000500594564639060412501869875154892004852422917750784 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade082Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade082Part01088 = 428519929410608912675140239382375448274874782071098190755163531559196412318638038883880715004877668721937612800 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade082Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade082Part01152 = 671737563964560741310012300612953903568116832577567019321674677577021168340918157675301465022184889902344175616 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade082Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade082Part01216 = 560480017290645174372289231761119693222286017928204866316082741855253971705488799870399357087785155663644065792 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade082Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade082Part01280 = 121046581647404446113929706665501769740949877658893012250282115109898201639784042081935720256057933454683144192 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade082Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade082Part01344 = 382713068769990274905346088982502160669281039198303377731111988441739209854034430333481633510356555627573018624 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade082Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade082Part01408 = 466933414636942031514089619165981705274802586633320706198400350549948067247090961807349648815468993869453983744 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade082Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade082Part01472 = 430230257078305310008281626135261581288775227779765610944195048755771204694184596691453160647510555439898034176 := by decide +kernel

theorem group_length : firstCenterIntegerGrade082Group002.size = 512 := by
  simp only [firstCenterIntegerGrade082Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade082Group002 = 3500902777938034754109684322815812716527457990398550293548910954443392874860551529213676855236246605102451785728 := by
  simp only [firstCenterIntegerGrade082Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade082Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
