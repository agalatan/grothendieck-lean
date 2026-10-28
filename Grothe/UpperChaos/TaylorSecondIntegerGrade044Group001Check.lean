import Grothe.UpperChaos.TaylorSecondIntegerGrade044Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade044Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade044Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade044Part00512 = 24024458290432370112491035364582973974055103620092357548382855123500543437395858244995802625166009224111587328 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade044Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade044Part00576 = 34216643678553177451766177532059371089242209600127236041115403026235738277824622681725109443591165861043372032 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade044Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade044Part00640 = 19556563750297228583200163602788347020004989694580459476153351532155849325241055856442635679764369704686190592 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade044Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade044Part00704 = 10245015758673558406817294382394828135905902814048142047612476110466568388983946720999763001350566825143828480 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade044Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade044Part00768 = 15987611482565572468931411552630611266470757634039012000795665584778000562767698009211619088410405929838706688 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade044Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade044Part00832 = 8391424928628645781176914283937847458792679884998812051086000903126395300153166274105789615084459857073405952 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade044Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade044Part00896 = 8292612647272610293836327355661917297301634237364405096399648752053754674807821308378904364941524759392288768 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade044Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade044Part00960 = 4267691689078791675968166590638581698344427225496121020018441168779050761646921378588609227351945646295744512 := by decide +kernel

theorem group_length : secondCenterIntegerGrade044Group001.size = 512 := by
  simp only [secondCenterIntegerGrade044Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade044Group001 = 124982022225501954774187490664694477940117704710746545281563842201095900728821090474448233045660447807585124352 := by
  simp only [secondCenterIntegerGrade044Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade044Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade044Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade044Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
