import Grothe.UpperChaos.TaylorSecondIntegerGrade035Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade035Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade035Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade035Part00000 = 1449285959123963105684376453487981299240165662840868804398667080832940396299090636472664529173298821862153781248 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade035Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade035Part00064 = 2328212810156683570256478548260849217374675422994964153463726245299991450001837161027244438556492467166605475840 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade035Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade035Part00128 = 1070562824844429859065520987109189074584758789398327808054747342287585219843288085189317346515234346302594613248 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade035Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade035Part00192 = 351893918491560813405806719637422018763212961448058307275900432375673942804798662132568488734851873998303657984 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade035Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade035Part00256 = 235959779033321504620019083972483686038185634109197308851172877781838972668792524411812206333497939575984619520 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade035Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade035Part00320 = 244356442570864769344500707349598895656561782612668206784599489045018954910454654871220779335766889914091700224 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade035Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade035Part00384 = 87990351218274951177111993257191231031640621053374348774140077728222232949095970214378417386266177917281107968 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade035Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade035Part00448 = 113999783156839141560823084643896594750768287344915953275179706339500362330213767540138447845807112070356795392 := by decide +kernel

theorem group_length : secondCenterIntegerGrade035Group000.size = 512 := by
  simp only [secondCenterIntegerGrade035Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade035Group000 = 5882261868595937715114637577718612017439969161802374890878133251690771531807571461859344653881215628807371751424 := by
  simp only [secondCenterIntegerGrade035Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade035Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade035Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade035Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
