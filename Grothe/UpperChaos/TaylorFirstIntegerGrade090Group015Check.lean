import Grothe.UpperChaos.TaylorFirstIntegerGrade090Group015Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade090Group015Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade090Part07680.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade090Part07680 = 7464365782565548945307332552810602458110977559464374381133006258426816596066079105456788213833695984877568 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade090Part07744.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade090Part07744 = 1487572143400836475918929870078923344173367613594029949415844543947469076541812010625530150147871295406080 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade090Part07808.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade090Part07808 = 7466396796932992638366830679040973150139489855691108033925323176065895161135526290065454915027392673087488 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade090Part07872.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade090Part07872 = 7247562663704611864366302845432568265355437987350335234356213645960915959565820884995821101814207924404224 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade090Part07936.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade090Part07936 = 11806612403362366212210329312228932974312008796264845813493634865271987089080572989689978947060092767305728 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade090Part08000.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade090Part08000 = 315569624476736005065409910824878458688999371826222562459362510970291291228798715166986807446383003435008 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade090Part08064.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade090Part08064 = 15498103611847461138101554702608255528794609721499549595702842662191554385874595389867034721973098606755840 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade090Part08128.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade090Part08128 = 10970434079532442786535420889996457984217298536060454604343300341638375424793213299916015713182292933754880 := by decide +kernel

theorem group_length : firstCenterIntegerGrade090Group015.size = 512 := by
  simp only [firstCenterIntegerGrade090Group015, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade090Group015 = 62256617105822996065872110763021592163792189441750920174829528004473304984286418685783610570485035189026816 := by
  simp only [firstCenterIntegerGrade090Group015, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade090Group015Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group015Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group015Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
