import Grothe.UpperChaos.TaylorSecondIntegerGrade037Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade037Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade037Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade037Part00512 = 67035605694015881554360449436516171723096636874225366987964367491104071875157600730282485589492974835208290304 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade037Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade037Part00576 = 48146225105190560570053954670902568480563424313379067344461890531985624597308154510085406042285793000780988416 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade037Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade037Part00640 = 39788366591903641914789449500464477839234082620496727772187003849783698768523164307430974076718375987859947520 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade037Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade037Part00704 = 28822021539089183059916022326730929707239863682990868943040676858189552628843299164820175199477005676202426368 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade037Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade037Part00768 = 20808754254128634185589122560949700459079939344537317273279034045739288126177666860340397051466222555602354176 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade037Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade037Part00832 = 15330758734500726902827883302093498206019557558412222696461730685098946662151027915232974968269026117772378112 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade037Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade037Part00896 = 6697304945194781793211231420386854316508709691585821890504452364067289771179886346773544187557384274701189120 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade037Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade037Part00960 = 7583826070178683256814328031480965394787364351036948960431303638598215892926671226514340490897823855267545088 := by decide +kernel

theorem group_length : secondCenterIntegerGrade037Group001.size = 512 := by
  simp only [secondCenterIntegerGrade037Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade037Group001 = 234212862934202093237562441249525166126529578436664341868330459464566688322267471061480297606164606303395119104 := by
  simp only [secondCenterIntegerGrade037Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade037Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade037Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade037Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
