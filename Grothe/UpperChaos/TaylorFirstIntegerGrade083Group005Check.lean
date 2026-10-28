import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade083Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade083Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade083Part02560 = 8213730915267681720887313078608867625562796497585466667992152484077322373591881923694468770307739630960640 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade083Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade083Part02624 = 42096841230766865045156572184248439221261205498995251243035688555862348132785041894328383662922592297047556096 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade083Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade083Part02688 = 34819094364316976707360667782079656782854577796832404796662728524191594339420978185917434084179440176503717888 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade083Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade083Part02752 = 28700059703659740254318882094805267414640197949645965889168222647338250645685430040224650575096039150131871744 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade083Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade083Part02816 = 7928715495511339582806677101887402231823453682277386563582270705521816037088239370843557931037590269460480 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade083Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade083Part02880 = 23518049260288783248515781811544009224134478988292635813874675404489738446775883798558899128692221041491050496 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade083Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade083Part02944 = 19153129763745564082196374059006788258240850536652609852763557121680014269266723961696885124708636862976098304 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade083Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade083Part03008 = 15491138472487600674791117205802615363344243777296568374908966699478434816367388450468071440215154077774905344 := by decide +kernel

theorem group_length : firstCenterIntegerGrade083Group005.size = 512 := by
  simp only [firstCenterIntegerGrade083Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade083Group005 = 163794455241676309033643089127667272534332940797895298823645413376229979788712126452488862042515428935825620992 := by
  simp only [firstCenterIntegerGrade083Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade083Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
