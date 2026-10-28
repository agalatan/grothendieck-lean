import Grothe.UpperChaos.TaylorFirstIntegerGrade038Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade038Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade038Part01536.size = 24 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade038Part01536 = 60207390611666824974463583126410017031892298389247382097272129689681007382508309993973068447975826858260299776 := by decide +kernel

theorem group_length : firstCenterIntegerGrade038Group003.size = 24 := by
  simp only [firstCenterIntegerGrade038Group003, len0]

theorem group_energy : energy firstCenterIntegerGrade038Group003 = 60207390611666824974463583126410017031892298389247382097272129689681007382508309993973068447975826858260299776 := by
  simp only [firstCenterIntegerGrade038Group003, sum0]

end Grothe.UpperChaos.TaylorFirstIntegerGrade038Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade038Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade038Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
