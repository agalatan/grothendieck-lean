import Grothe.UpperChaos.TaylorSecondIntegerGrade040Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade040Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade040Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade040Part00512 = 40612103525543812451643624571685980744405893554396282157361919070328113708939865550586258644183485294919548928 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade040Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade040Part00576 = 38384327240640795938214054279246655510247253414352967597151698783120528835578467545240209538969403530093264896 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade040Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade040Part00640 = 15468713029545852091070564825526765762186982427618885678671775595332822597364885433202735226895094202731855872 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade040Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade040Part00704 = 30650533794507496569376407306153028597597556523784981861536586794631773203201900859157374518585189478107709440 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade040Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade040Part00768 = 16842926008914379060007441733308552910679764538810973852096643247178044727389740159027445677050655923490521088 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade040Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade040Part00832 = 9327483945251812061464543478252096891384223769567112862048848573793152383421555795378778891546327686464929792 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade040Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade040Part00896 = 9784091254156956305832959767003238788892420428202502285500678482228698349685512044550120184605867249024106496 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade040Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade040Part00960 = 6199492198430047604838247211457156692183819286838999115207573783461980947191806091218212310753869607171260416 := by decide +kernel

theorem group_length : secondCenterIntegerGrade040Group001.size = 512 := by
  simp only [secondCenterIntegerGrade040Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade040Group001 = 167269670996991152082447843172633475897577913943572705409575724330075114752773733478361134992589892972003196928 := by
  simp only [secondCenterIntegerGrade040Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade040Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade040Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade040Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
