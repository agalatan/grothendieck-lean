import Grothe.UpperChaos.TaylorFirstIntegerGrade059Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade059Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade059Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade059Part03584 = 129235804377825484637649776798808543404250780374602240977375938798883402313178383479183376015284543766396928 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade059Part03648.size = 12 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade059Part03648 = 150322366235291527519982896735598943119897319599217295822941964395376979838686845044157706816807044376428544 := by decide +kernel

theorem group_length : firstCenterIntegerGrade059Group007.size = 76 := by
  simp only [firstCenterIntegerGrade059Group007, Array.size_append, len0, len1]

theorem group_energy : energy firstCenterIntegerGrade059Group007 = 279558170613117012157632673534407486524148099973819536800317903194260382151865228523341082832091588142825472 := by
  simp only [firstCenterIntegerGrade059Group007, energy_append, sum0, sum1]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade059Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade059Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade059Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
