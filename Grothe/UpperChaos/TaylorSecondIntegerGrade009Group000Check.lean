import Grothe.UpperChaos.TaylorSecondIntegerGrade009Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade009Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade009Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade009Part00000 = 133434196363265583186538761901269043539701707621439848865879697679875332116708163724552691586909580779969868464128 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade009Part00064.size = 46 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade009Part00064 = 1236984349577031292781493804089011502857348441734942444188723365641107193964565207472891890552649313431712694272 := by decide +kernel

theorem group_length : secondCenterIntegerGrade009Group000.size = 110 := by
  simp only [secondCenterIntegerGrade009Group000, Array.size_append, len0, len1]

theorem group_energy : energy secondCenterIntegerGrade009Group000 = 134671180712842614479320255705358055042559056063174791310068421045516439310672728932025583477462230093401581158400 := by
  simp only [secondCenterIntegerGrade009Group000, energy_append, sum0, sum1]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade009Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade009Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade009Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
