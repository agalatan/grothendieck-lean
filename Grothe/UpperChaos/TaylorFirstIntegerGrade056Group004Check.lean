import Grothe.UpperChaos.TaylorFirstIntegerGrade056Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade056Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade056Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade056Part02048 = 48681784134614685192533210029256390020219871160467170886574357914711024315711245541427334649219672171608014848 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade056Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade056Part02112 = 37042465383638432318338616551275100919518954575565299261282993719658729755260233506873228362839283554387492864 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade056Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade056Part02176 = 29688114732287822073256185759553710281924849564401554243142790922396192641979388800643814976809129922084732928 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade056Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade056Part02240 = 24091774372716329036688579247965589765665141134206204261262688989746532196591663546338858927636281475941269504 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade056Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade056Part02304 = 19334184866479012331118730035487030883237344024169643146170640677511618498945256228757449922847116216605081600 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade056Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade056Part02368 = 16624135065689139757644585976299551363762550615266522849335813878067072909460073283027979023028904171673747456 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade056Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade056Part02432 = 16138624306409497216149964122581778081286563608655376139696648943301585983667475861392985433905145952526663680 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade056Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade056Part02496 = 5516627462440090875400635786433097990198462801189081815842200348969891514368489375616010951220473431538532352 := by decide +kernel

theorem group_length : firstCenterIntegerGrade056Group004.size = 512 := by
  simp only [firstCenterIntegerGrade056Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade056Group004 = 197117710324275008801130507508852249305813737483920852603308135394362647815983826144077662247506006896365535232 := by
  simp only [firstCenterIntegerGrade056Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade056Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade056Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade056Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
