import Grothe.UpperChaos.TaylorFirstIntegerGrade007Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade007Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade007Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade007Part00000 = 47160960470451829017941703071483542247797951825148567484072768921554814754384270800671455671480248640140880897900544 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade007Part00064.size = 8 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade007Part00064 = 465846749005830690111236466852337065057495852210881451847000792107873414725155738849177265759070291310378221568 := by decide +kernel

theorem group_length : firstCenterIntegerGrade007Group000.size = 72 := by
  simp only [firstCenterIntegerGrade007Group000, Array.size_append, len0, len1]

theorem group_energy : energy firstCenterIntegerGrade007Group000 = 47161426317200834848631814307950394584863009321000778365524615922346922627798995956410304848746007710432191276122112 := by
  simp only [firstCenterIntegerGrade007Group000, energy_append, sum0, sum1]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade007Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade007Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade007Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
