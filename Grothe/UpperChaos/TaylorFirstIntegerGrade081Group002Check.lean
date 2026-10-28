import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade081Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade081Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade081Part01024 = 914029249739707408535267432076554844901975175344805024192571519110932436145284123391597505793638656030986469376 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade081Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade081Part01088 = 165667796663207907984390645514478258463361093631294549563749749114257578252712854869838455775547757810199560192 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade081Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade081Part01152 = 547693935495021326768140352628385175558486791738322954011436896819007907807430764531609537346182427308025970688 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade081Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade081Part01216 = 599067477345220842180221599041065442781446280807077839054508173344672339393964730408323707723795920601900646400 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade081Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade081Part01280 = 543332603039797062667912477231296150503480619136907416895073193952859905360719795686253762109818177322068475904 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade081Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade081Part01344 = 33969055121949416349165941180142105442459292075335786407665277803510508897299557927601174852779209336125652992 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade081Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade081Part01408 = 471473272460486443316674074304974325944307555838946592445917661460342468622673031025113872917185160080030433280 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade081Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade081Part01472 = 466112566562788675896288186289622998178345923892280552388211844716222211722455787997038400924277777739125096448 := by decide +kernel

theorem group_length : firstCenterIntegerGrade081Group002.size = 512 := by
  simp only [firstCenterIntegerGrade081Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade081Group002 = 3741345956428179083698060708266519301773862732464970714959134316321805356202540645837376417443225086228462305280 := by
  simp only [firstCenterIntegerGrade081Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade081Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
