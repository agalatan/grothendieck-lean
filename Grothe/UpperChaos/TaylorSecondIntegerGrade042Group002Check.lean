import Grothe.UpperChaos.TaylorSecondIntegerGrade042Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade042Group002Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade042Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade042Part01024 = 3748210237634170740822811368999925106239308010914149485799049210122600793663406427250979159681028821998370816 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade042Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade042Part01088 = 3391334106003979750524965263355460241339179456251680252612121196684656900737421712875883458366974340282449920 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade042Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade042Part01152 = 1995708891980213140300609117005227133227021252113049877571875723679636168792204133767599706728682483093602304 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade042Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade042Part01216 = 2444648903355999882654639587810639489982411599035022715347624837474926706536837954079481938889073575686307840 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade042Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade042Part01280 = 1067599867029934467656001119730608530731642652212835090499469248435370562860272390005177326855001546222993408 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade042Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade042Part01344 = 1644655906471946117512025477347100849522273165757358261570052889655413293578532280207696717338989240168480768 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade042Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade042Part01408 = 778070704346476935806832032771659409149637400385287222634010680292558017403636488184958706762108249627951104 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade042Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade042Part01472 = 920042351997361864044146730361228114525429258859740720921909088323420418944924686828129400332921451539595264 := by decide +kernel

theorem group_length : secondCenterIntegerGrade042Group002.size = 512 := by
  simp only [secondCenterIntegerGrade042Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade042Group002 = 15990270968820082899322030697381848874716902795529123626956112874668582862517236073199906414954779708619751424 := by
  simp only [secondCenterIntegerGrade042Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade042Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade042Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade042Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
