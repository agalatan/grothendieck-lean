import Grothe.UpperChaos.TaylorSecondIntegerGrade045Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade045Group004Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade045Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade045Part02048 = 179642242375666459457071636237144811945259371815596728498943448624410360038371323716534739354062224581722112 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade045Part02112.size = 50 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade045Part02112 = 89297331640003919805785751641250754282943940613114731527887371434709805959984846307389489714592669587472384 := by decide +kernel

theorem group_length : secondCenterIntegerGrade045Group004.size = 114 := by
  simp only [secondCenterIntegerGrade045Group004, Array.size_append, len0, len1]

theorem group_energy : energy secondCenterIntegerGrade045Group004 = 268939574015670379262857387878395566228203312428711460026830820059120165998356170023924229068654894169194496 := by
  simp only [secondCenterIntegerGrade045Group004, energy_append, sum0, sum1]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade045Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade045Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade045Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
