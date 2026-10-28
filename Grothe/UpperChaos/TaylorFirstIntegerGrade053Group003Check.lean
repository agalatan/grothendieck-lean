import Grothe.UpperChaos.TaylorFirstIntegerGrade053Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade053Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade053Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade053Part01536 = 660224917878213124658816465998962906424201733677501968310123394860046584487275318199009849207838333257027420160 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade053Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade053Part01600 = 300580693487958415308772243055476522020425393671842430711394802243040593584120324082686867889175720160187645952 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade053Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade053Part01664 = 226635104847905125730169368568287108359828238496633112010733148849296788183480077661989914316248759941380177920 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade053Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade053Part01728 = 163038322003507457970882455496384489042139882897592750407645016986080592381647963284687239588294309676872368128 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade053Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade053Part01792 = 113979995610412365452143975429943871927484481508030117226327968440429981250507343011942825762375384020709015552 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade053Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade053Part01856 = 84606124524692471054879653464623428303853472950616945373598530350899430713409726486664645513988872849852465152 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade053Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade053Part01920 = 120001958722787614738031837024448946947357390578758398740360118435610278160697390060414124147925949692109651968 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade053Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade053Part01984 = 52760438407207255421173011647491811318611472480611909484537871962784983719002032469076342350080628411319975936 := by decide +kernel

theorem group_length : firstCenterIntegerGrade053Group003.size = 512 := by
  simp only [firstCenterIntegerGrade053Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade053Group003 = 1721827555482683830334869010685619084343902066261587632264720852128189232480140175256471808775927958009458720768 := by
  simp only [firstCenterIntegerGrade053Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade053Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade053Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade053Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
