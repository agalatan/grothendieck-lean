import Grothe.UpperChaos.TaylorFirstIntegerGrade056Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade056Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade056Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade056Part02560 = 3970405778580971854056828427258535659455743950205196313099509483626802826974717840967416886957322213930303488 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade056Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade056Part02624 = 3368553015842614290575148557576465990929719714496201064373974463767563733970003724715804398274795851745329152 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade056Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade056Part02688 = 3420574217087714118169631018423429800973996318029595132191540750657191084077232373722090014100062853033623552 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade056Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade056Part02752 = 2988482345810746060160782952763152293841766005545417920830923910827715490916332122153191343050757763896442880 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade056Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade056Part02816 = 2178141588285585177685751109973578513555034950687830768301868855198135910236095406695225441022192947279429632 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade056Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade056Part02880 = 1620739040599710448175844857163035553443975944767102572350336992822848823762324068391553626071134516426047488 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade056Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade056Part02944 = 1275144559171005296351004994043918363001263101120694296489612863277371988285776551610350380917060902431227904 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade056Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade056Part03008 = 997126776513898574204829884369956348842136110230471181579202031711610349785840066815600164899542157896974336 := by decide +kernel

theorem group_length : firstCenterIntegerGrade056Group005.size = 512 := by
  simp only [firstCenterIntegerGrade056Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade056Group005 = 19819167321892245819379821801572072524043636095082509249216969351889240208008322155071232255292869206639378432 := by
  simp only [firstCenterIntegerGrade056Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade056Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade056Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade056Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
