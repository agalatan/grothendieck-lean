import Grothe.UpperChaos.TaylorFirstIntegerGrade088Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade088Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade088Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade088Part02048 = 145733703584815082132230478250386560899138195841978314615640281887172014973044161839524538547518069466455867392 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade088Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade088Part02112 = 122408056771818348511463579824111613473211393175728346548668359780932880392003749819078675756343665000001306624 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade088Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade088Part02176 = 36070498639374183010572415321624164575951853279166953695633739201819121527619396651207039916108778018177024 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade088Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade088Part02240 = 102440452178834055168533999169986188771809342303063826011977451270243272017008173645941624716048075727589867520 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade088Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade088Part02304 = 85625520778698269141563478094442378550698267987193831132818294081376639396921993825699589661152781423058354176 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade088Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade088Part02368 = 41276545543664004943642435644702759070205819202106301830797825325292931081061754624224458038070813015542857728 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade088Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade088Part02432 = 30117116040562667437064720074885646688501130087827555005890633929602943526789265183994287808535383272180416512 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade088Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade088Part02496 = 59328632837407616641888875034833611802553229526050336031163725049539323245935591589441674285473505157689901056 := by decide +kernel

theorem group_length : firstCenterIntegerGrade088Group004.size = 512 := by
  simp only [firstCenterIntegerGrade088Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade088Group004 = 586966098234439418159398138508670383420693329977227678130652205063361823754292309924556055853058401840536748032 := by
  simp only [firstCenterIntegerGrade088Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade088Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
