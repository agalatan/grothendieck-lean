import Grothe.UpperChaos.TaylorFirstIntegerGrade046Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade046Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade046Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade046Part01024 = 2134169525588619985453554867644061315208212752623859529704829109566641731170047013583077499628684081566352146432 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade046Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade046Part01088 = 2163426369050706718688877067645734192238333973136409117304854680880597233364254240783918210861325924127836471296 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade046Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade046Part01152 = 850654110391164135327577496947172682947615188702419242093387860867461230457885073542290409396266111391510822912 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade046Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade046Part01216 = 482372552218077168045317248877607605365169258931849484082121210255617733350430165987354936879028493963768102912 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade046Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade046Part01280 = 470334720510453928925796191203519674263532396145603346577672566927826459186946708033000201361214849546719330304 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade046Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade046Part01344 = 230356648454210169418622660205870397863226391431380263864175528365278042075455488720240267606537233781445623808 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade046Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade046Part01408 = 135820368468462574273361668209336376040060735514501945769353303997067004441371928212371765253431061484350210048 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade046Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade046Part01472 = 233277852764432385031115099379242391048457420543949122966008527300876692336335530505474898146228519487450120192 := by decide +kernel

theorem group_length : firstCenterIntegerGrade046Group002.size = 512 := by
  simp only [firstCenterIntegerGrade046Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade046Group002 = 6700412147446127065164222300112544634974608117029972052362402788161366126382726149367728189132716275349432827904 := by
  simp only [firstCenterIntegerGrade046Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade046Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade046Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade046Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
