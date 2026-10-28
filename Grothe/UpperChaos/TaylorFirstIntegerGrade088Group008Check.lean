import Grothe.UpperChaos.TaylorFirstIntegerGrade088Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade088Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade088Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade088Part04096 = 919921027723157418401200786459929391570204285345057584092481659231443120930286133939562668065894328464048128 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade088Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade088Part04160 = 14670623395050643826791298195260855648185257460325615899189400982994237458460920177494881311110235066204160 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade088Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade088Part04224 = 645143478906716096823982473755299305385354090696592239838822650155261373673577313090589878256120789116911616 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade088Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade088Part04288 = 459260462484223402522965815289362329257919013313337042488933166136195297771832749354228759865892718671560704 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade088Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade088Part04352 = 301906969760953327229093458500835550373621791106327652829098406737263508466245901504950931359684928219381760 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade088Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade088Part04416 = 5158235597751328960139749136588952249107928887318415207991372709220029121356218201733077982965234514526208 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade088Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade088Part04480 = 193764803857919417541989288572472962807463457128312458852416116526026823797301384097232915392718244757372928 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade088Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade088Part04544 = 119685796110207316076622419979815772001439029519566034725021464837694768477872849992935501621839109126356992 := by decide +kernel

theorem group_length : firstCenterIntegerGrade088Group008.size = 512 := by
  simp only [firstCenterIntegerGrade088Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade088Group008 = 2659511397835978951382785289889565119293294853456837043933954237316099159696933470358728613856225587936362496 := by
  simp only [firstCenterIntegerGrade088Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade088Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
