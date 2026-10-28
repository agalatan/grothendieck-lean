import Grothe.UpperChaos.TaylorFirstIntegerGrade051Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade051Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade051Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade051Part00000 = 208897577534444287420515262074309535379513955144583461442397181215891892422891953451053356078779314973106554011648 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade051Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade051Part00064 = 122485429222707283603323012208240243838576900479582002481637793574690017471813790450920251889803392332724351008768 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade051Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade051Part00128 = 75970921994465560518073814453688917823110191110544000763593167354248361623693708768535700067232808808595826147328 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade051Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade051Part00192 = 54089192062779981349322807782103285576918339333754516419737415676045838317602694511631235916988442639814900056064 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade051Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade051Part00256 = 165459156925302807245996923512059414468813572810326412342870185064474557605996025650964142580222452531768898617344 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade051Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade051Part00320 = 138039922694060778052673439359914589244616933090331404932073679793641432253417581582066416782635534369560866062336 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade051Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade051Part00384 = 107817198807621654840886469350719435830970890463510804345777171854867850031458181927391156570513915466745821265920 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade051Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade051Part00448 = 85931762188929987707835541188874125093090115048217187980233255762154936512675832527772115103699657672350473650176 := by decide +kernel

theorem group_length : firstCenterIntegerGrade051Group000.size = 512 := by
  simp only [firstCenterIntegerGrade051Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade051Group000 = 958691161430312340738627269929909547255610897480849790708319850296014886239549768870334374989875518794667690819584 := by
  simp only [firstCenterIntegerGrade051Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade051Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade051Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade051Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
