import Grothe.UpperChaos.TaylorFirstIntegerGrade039Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade039Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade039Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade039Part01536 = 32226487254191238735810519274546477156462323821112354444404047651768183317008812084375907286091984632859852800 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade039Part01600.size = 40 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade039Part01600 = 48367887094093539795846781170533228210470283720035471830189552692108245746502975460020470686321531729423106048 := by decide +kernel

theorem group_length : firstCenterIntegerGrade039Group003.size = 104 := by
  simp only [firstCenterIntegerGrade039Group003, Array.size_append, len0, len1]

theorem group_energy : energy firstCenterIntegerGrade039Group003 = 80594374348284778531657300445079705366932607541147826274593600343876429063511787544396377972413516362282958848 := by
  simp only [firstCenterIntegerGrade039Group003, energy_append, sum0, sum1]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade039Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade039Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade039Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
