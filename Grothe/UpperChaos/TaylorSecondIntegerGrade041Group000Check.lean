import Grothe.UpperChaos.TaylorSecondIntegerGrade041Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade041Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade041Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade041Part00000 = 1055795441932711513644224266831943766534148629723578706268960370308995811873172051811967508627442101901905100800 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade041Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade041Part00064 = 551575706833837587480973748814146095325891439644490844543802058269711542450651600875097105655379170310429343744 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade041Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade041Part00128 = 251523901682589226229210036753406781772339905937328941350580922629251753776782936258147699758625269088079839232 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade041Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade041Part00192 = 275538466814754280607745903062040040533364547493222890091198333250828508738992330927956250868251311907606102016 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade041Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade041Part00256 = 193458248242451936837033160609736769969745872909950819716113915726325092060333004715941518951909594345525739520 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade041Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade041Part00320 = 97102443279019177064666697806135152750193370276605054665205510200625259851837874138053650051152841627463057408 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade041Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade041Part00384 = 89898658471899429956528935560838486257416463137467819655690136646098646682893248867860549392521215321034457088 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade041Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade041Part00448 = 67832209383487978295285017915201282561767721220985635350770717342440568032903822445264052705259189739982946304 := by decide +kernel

theorem group_length : secondCenterIntegerGrade041Group000.size = 512 := by
  simp only [secondCenterIntegerGrade041Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade041Group000 = 2582725076640751130115667767353448375704867950343630711642321964374277183467566870040288336010540694242026586112 := by
  simp only [secondCenterIntegerGrade041Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade041Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade041Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade041Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
