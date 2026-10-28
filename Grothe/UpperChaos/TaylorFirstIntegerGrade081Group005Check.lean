import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade081Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade081Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade081Part02560 = 47123761835058531962995696716073468099706140751507250807151299392312590307200877385081348062321635999266897920 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade081Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade081Part02624 = 38527629050618859275316542671061274872669847749791512325185106192426473638449249763438989848454557474115026944 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade081Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade081Part02688 = 31407039592654238577417068282846783573220496428967835674506240759132959941197949683772619211747722891054022656 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade081Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade081Part02752 = 22904859197475353462205265732655220960040320098128424307885660476991037212131107935484291093815129892978688 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade081Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade081Part02816 = 25538531353146783987857027394419226479915674612986203402589252439179204806712243570287245276146615901277388800 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade081Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade081Part02880 = 20771730152695665786172068998073705194814959448220741755688343501298747157618182276833418752661494019276144640 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade081Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade081Part02944 = 16820818722490904942869411648388269059465398222315877131707396902429730401948628242108406826599209607509311488 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade081Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade081Part03008 = 4687437187141506675355141734144420178793283515488553512006159900959162730121276335154513665495855836671508480 := by decide +kernel

theorem group_length : firstCenterIntegerGrade081Group005.size = 512 := by
  simp only [firstCenterIntegerGrade081Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade081Group005 = 184899852753003966561445162710739802679545841049376103033141684748215860020460538364612025934520906859063279616 := by
  simp only [firstCenterIntegerGrade081Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade081Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
