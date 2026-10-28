import Grothe.UpperChaos.TaylorFirstIntegerGrade089Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade089Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade089Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade089Part00512 = 1732718910775907552682084656163114631840423725894939671236948520647666457096697568202144981427053641770991616000 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade089Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade089Part00576 = 1500847754312368315608326143909689155525270868356426451523525106932981800130018502700187054000637195535052177408 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade089Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade089Part00640 = 185237689971117698524999424151289320920739366131720827104032855365738308023749857797431778044771424187340292096 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade089Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade089Part00704 = 1531450778923697846683517475373075679631795458120721881688181881791726118474308076001483198331127708162671509504 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade089Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade089Part00768 = 1345219163964397403799241115912809686138137698227307768306874782322724264594056800630018076634244940838551420928 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade089Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade089Part00832 = 330585318217706652202545933867394122856017898444336522397235691968339010395386202954138196357084467014139904 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade089Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade089Part00896 = 1189314849743271545231390467995737239173516010075527733801522741686480138659914013900410527898648486446777761792 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade089Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade089Part00960 = 1021229941613397288293374893406062212830845290906334732192096146864423657084425663073837518314649778321883136000 := by decide +kernel

theorem group_length : firstCenterIntegerGrade089Group001.size = 512 := by
  simp only [firstCenterIntegerGrade089Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade089Group001 = 8506349674622375357475136722845645320183584435611423402375579271303709083073565868508467272847490259730282053632 := by
  simp only [firstCenterIntegerGrade089Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade089Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
