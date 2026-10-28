import Grothe.UpperChaos.TaylorFirstIntegerGrade053Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade053Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade053Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade053Part02560 = 4296903373788476937067193848403057715337640299309710221157047925022779082196566968677573173575937157408751616 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade053Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade053Part02624 = 3351911236007129744693579937851055054442995909694135647223409586081593317109218785737475344645078552496046080 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade053Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade053Part02688 = 4035796816397176969182150549292519498219689092499199488078137265541415200824665190810584059202631680978321408 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade053Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade053Part02752 = 1333492290069935564432094029645062781665048575385121281076929488815458392277998844001572853978179436535611392 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade053Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade053Part02816 = 922276784187036016778471862336671385810540787004623988355873075440744710198937551126508421136888489475833856 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade053Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade053Part02880 = 1195248138138249188119041163063596913527577009550529349960467015865296387818859808911078025493355428159946752 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade053Part02944.size = 26 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade053Part02944 = 1664510988721947520193881998735175848550038856520138865815056904327865899542933029320701833596741325605044224 := by decide +kernel

theorem group_length : firstCenterIntegerGrade053Group005.size = 410 := by
  simp only [firstCenterIntegerGrade053Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6]

theorem group_energy : energy firstCenterIntegerGrade053Group005 = 16800139627309951940466413389327139197553530529963458841666921261095152989969180178585493711628812070659555328 := by
  simp only [firstCenterIntegerGrade053Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade053Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade053Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade053Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
