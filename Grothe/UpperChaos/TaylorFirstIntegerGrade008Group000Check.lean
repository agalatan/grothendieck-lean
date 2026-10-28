import Grothe.UpperChaos.TaylorFirstIntegerGrade008Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade008Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade008Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade008Part00000 = 57362216667996588118137033812211383758544126731452761121019320959981953739122940268497770878571579870139374395981824 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade008Part00064.size = 26 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade008Part00064 = 16542412188657061632799327587627072592891097985724340841669311159287928009747717298934032845807313846525017194496 := by decide +kernel

theorem group_length : firstCenterIntegerGrade008Group000.size = 90 := by
  simp only [firstCenterIntegerGrade008Group000, Array.size_append, len0, len1]

theorem group_energy : energy firstCenterIntegerGrade008Group000 = 57378759080185245179769833139799010831137017829438485461860990271141241667132687985796704911417387183985899413176320 := by
  simp only [firstCenterIntegerGrade008Group000, energy_append, sum0, sum1]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade008Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade008Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade008Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
