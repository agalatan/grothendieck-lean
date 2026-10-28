import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group010Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade076Group010Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade076Part05120.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade076Part05120 = 23544835739118271988944767521807628415699433180616665631329861187078590000146605235907301689621582184448000 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade076Part05184.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade076Part05184 = 26388652696611796443991141598354917413491631424105690457424065152120840165221285100480892957359303768932352 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade076Part05248.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade076Part05248 = 21687630543180980412808481949082161026161353703290352065995917998402494705565609043790542397697545063104512 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade076Part05312.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade076Part05312 = 11336483936179840485575366629995581509221527685254010425035566208308055583444457967735157385288553297084416 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade076Part05376.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade076Part05376 = 6180432736654435045713943117771095732159548781695563052699827475047532610372930348505526358702780353347584 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade076Part05440.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade076Part05440 = 16116118258762128847747103592949716448475153923929574179979738311436422177610245170293315535331234018230272 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade076Part05504.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade076Part05504 = 17120664705012880908305897926575951026958167255970970332140750186105694591545022691056435026910702162935808 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade076Part05568.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade076Part05568 = 14631267526502491787934823529075301742411870996170030999188429248962846236687092362782400073674123577917440 := by decide +kernel

theorem group_length : firstCenterIntegerGrade076Group010.size = 512 := by
  simp only [firstCenterIntegerGrade076Group010, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade076Group010 = 137006086142022825921021525865612353314578686951032857143794155767462476070593247920551571424585824426000384 := by
  simp only [firstCenterIntegerGrade076Group010, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade076Group010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group010Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group010Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
