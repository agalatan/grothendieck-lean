import Grothe.UpperChaos.TaylorFirstIntegerGrade087Group015Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade087Group015Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade087Part07680.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade087Part07680 = 5928846100065110502259660620061407517896850052474463837031548779857044885606533943548614192199113807757312 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade087Part07744.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade087Part07744 = 219109285608563193551981616225638429583102690219243651548269385676079595963080187726707847318671460417536 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade087Part07808.size = 24 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade087Part07808 = 2277381072399573366136614133791024610642096419222993031576411849971101461380106496722442608929992601501696 := by decide +kernel

theorem group_length : firstCenterIntegerGrade087Group015.size = 152 := by
  simp only [firstCenterIntegerGrade087Group015, Array.size_append, len0, len1, len2]

theorem group_energy : energy firstCenterIntegerGrade087Group015 = 8425336458073247061948256370078070558122049161916700520156230015504225942949720627997764648447777869676544 := by
  simp only [firstCenterIntegerGrade087Group015, energy_append, sum0, sum1, sum2]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade087Group015Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group015Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group015Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
