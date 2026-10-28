import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade073Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade073Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade073Part04608 = 30320680809356643466339863339570134889926904176732084856756935635193855963424161752041065246928128092143616 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade073Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade073Part04672 = 28163870323865226047020720995006307594093052126140462772263704797838147828998586791545229974920086662676480 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade073Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade073Part04736 = 15406663546290923719805020419385968990566735335676913648127664413789490580600961392895116177538706877448192 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade073Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade073Part04800 = 19212843831046048093210772975482505206106727887166807303319184047308844329917424726176382318852234895425536 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade073Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade073Part04864 = 25169948373903410500864811826027940668342578314019655469852512270738248462018862926126787510818442582163456 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade073Part04928.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade073Part04928 = 19521567306434361220083633467190795539629699710613205035398796351685965126817355553282901224279085668106240 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade073Part04992.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade073Part04992 = 20101026235820573155114361771705436420355105896485311217366722818515781240785744425830350432894600928559104 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade073Part05056.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade073Part05056 = 20159279488347265183392870137614853501688849214801506540461411966451003642843528527904547565595883078680576 := by decide +kernel

theorem group_length : firstCenterIntegerGrade073Group009.size = 512 := by
  simp only [firstCenterIntegerGrade073Group009, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade073Group009 = 178055879915064451385832054931983942810709652661635946843546932301521337175406626095802380451827168785203200 := by
  simp only [firstCenterIntegerGrade073Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade073Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
