import Grothe.UpperChaos.TaylorFirstIntegerGrade026Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade026Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade026Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade026Part00512 = 1904447453905504472289050228587245469809485748069537009647464944091543966492244278994686472163787986853160812544 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade026Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade026Part00576 = 1495194739692107459679870517339491884567928617611329704577558562851103905625470465913827226135082430710702669824 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade026Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade026Part00640 = 969226186825688725341563639740174943161352225729986384074274503164223046865269905905686920660277858650975895552 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade026Part00704.size = 52 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade026Part00704 = 249595653994584855186741852423986373414342689141779744350203013985843407789376320984894869182518303554902425600 := by decide +kernel

theorem group_length : firstCenterIntegerGrade026Group001.size = 244 := by
  simp only [firstCenterIntegerGrade026Group001, Array.size_append, len0, len1, len2, len3]

theorem group_energy : energy firstCenterIntegerGrade026Group001 = 4618464034417885512497226238090898670953109280552632842649501024092714326772360971799095488141666579769741803520 := by
  simp only [firstCenterIntegerGrade026Group001, energy_append, sum0, sum1, sum2, sum3]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade026Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade026Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade026Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
