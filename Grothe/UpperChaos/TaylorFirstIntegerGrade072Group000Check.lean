import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade072Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade072Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade072Part00000 = 8134112115591197162080554694794229672066481433331389824231920242201484548642317168686832056456214563063584522240 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade072Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade072Part00064 = 9931694118532149017685473872926007632749281519623800329186451700799836547292531663170470010330870070824652505088 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade072Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade072Part00128 = 11947842166463243748758593071497171932614865365461573151606915778450179653281695726584354110285796640050013798400 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade072Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade072Part00192 = 13349549296762980863399201645687386490893604381987090200096771689837803968081622713349547266177724485393132290048 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade072Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade072Part00256 = 13779015503916975252278066135218164211629695104075395726420222605385703293316206950396324932954074746550971531264 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade072Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade072Part00320 = 13104251407614661712558996979655099550094427909178730194525810764192886989349256265108730868389266635970274394112 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade072Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade072Part00384 = 11455385535455693860821961627279768430297697035033104510899730655768783721753478391529496296671856794486408478720 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade072Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade072Part00448 = 268921564779259342604053148447325683586723467942742834850153937906377979629469009647284895106599709840498491392 := by decide +kernel

theorem group_length : firstCenterIntegerGrade072Group000.size = 512 := by
  simp only [firstCenterIntegerGrade072Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade072Group000 = 81970771709116160960186901175505153603932776216633826771817977374543056701346577888473040436372403646179536011264 := by
  simp only [firstCenterIntegerGrade072Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade072Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
