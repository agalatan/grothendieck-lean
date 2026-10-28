import Grothe.UpperChaos.TaylorFirstIntegerGrade088Group014Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade088Group014Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade088Part07168.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade088Part07168 = 10218450757281853087127398411592710850380279612158465574498158635601196063042569481823439504792718613151744 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade088Part07232.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade088Part07232 = 9674843062306556585821586161338234077569418996653824153804131500894953975751957111663452785330342164692992 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade088Part07296.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade088Part07296 = 378986186225835949353661359963388581006233454601655071197772191408918944316433246673252800586528998817792 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade088Part07360.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade088Part07360 = 7894776948317460052842347857890989924225222117758646533318065483714797456801503031910082785076670158077952 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade088Part07424.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade088Part07424 = 9791053388987396451344830958952070952341792367614349289043848303910651321791442376523790080129284328914944 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade088Part07488.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade088Part07488 = 5057147372928545520466493580866862493696184252553822040429523345524349622155378267389380019245791460720640 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade088Part07552.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade088Part07552 = 2949022451388320028833194607300843444577993411832898273679546487417795708848804695614066204715760046047232 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade088Part07616.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade088Part07616 = 13413419777827538748065636640209091164244117017129564897453286930095054547379829469751834774001084071411712 := by decide +kernel

theorem group_length : firstCenterIntegerGrade088Group014.size = 512 := by
  simp only [firstCenterIntegerGrade088Group014, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade088Group014 = 59377699945263506423855149578114191488041241230303225833424332878567717640087917681349298953878179841835008 := by
  simp only [firstCenterIntegerGrade088Group014, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade088Group014Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group014Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group014Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
