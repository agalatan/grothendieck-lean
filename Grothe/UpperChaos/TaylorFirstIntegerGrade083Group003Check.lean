import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade083Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade083Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade083Part01536 = 19808204005463621820160605788879469516069576314292548093787039851928803000434907142565124615370008680621670400 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade083Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade083Part01600 = 358859959916346454081254551211416196508157606115472956737416838504606179162034951676118867299639296218070253568 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade083Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade083Part01664 = 318288927679694180906282808963414969148921393832239441157921883155423706372556037043041491592943346814107516928 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade083Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade083Part01728 = 274103650304162062356734171807614676693877172848499877633424630918736338704118554030917271614386198814077747200 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade083Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade083Part01792 = 2057606119298260792271739319316675907851197156138220379916206558457159117340076620371259229695093202900484096 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade083Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade083Part01856 = 235770469177465540313175470035792012252928764257950937866104923915320879096543172198048231836570964305941364736 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade083Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade083Part01920 = 198825978591247165585419022419599572992060235110035892907365536278585820768976915285337072891152344001028292608 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade083Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade083Part01984 = 165593739445607559399650465537955793542530777650279326625434506077283820273494051411976285577925668968910028800 := by decide +kernel

theorem group_length : firstCenterIntegerGrade083Group003.size = 512 := by
  simp only [firstCenterIntegerGrade083Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade083Group003 = 1573308535239284845254948835083989366562396723284909201401371565260342706495498665408375604657682921005657358336 := by
  simp only [firstCenterIntegerGrade083Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade083Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
