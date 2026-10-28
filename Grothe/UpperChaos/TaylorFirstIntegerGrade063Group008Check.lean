import Grothe.UpperChaos.TaylorFirstIntegerGrade063Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade063Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade063Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade063Part04096 = 24298579779650460046499845365102897710658362220300098583967264203070982289166089259475229815594640667049984 := by decide +kernel

theorem group_length : firstCenterIntegerGrade063Group008.size = 64 := by
  simp only [firstCenterIntegerGrade063Group008, len0]

theorem group_energy : energy firstCenterIntegerGrade063Group008 = 24298579779650460046499845365102897710658362220300098583967264203070982289166089259475229815594640667049984 := by
  simp only [firstCenterIntegerGrade063Group008, sum0]

end Grothe.UpperChaos.TaylorFirstIntegerGrade063Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade063Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade063Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
