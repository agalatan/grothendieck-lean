import Grothe.UpperChaos.TaylorFirstIntegerGrade065Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade065Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade065Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade065Part02048 = 159720468419751853764515149169262615127816976430400521520032926998510613932786611366193818397447274042654457856 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade065Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade065Part02112 = 123689569499625261026753037469318417528391454471817893432536584719966997279609352878168187079592428265520758784 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade065Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade065Part02176 = 94922520509962472748332571354524799475780372930161258606193667453923898336315880882499252292827834106207272960 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade065Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade065Part02240 = 71977457420479262327609278269101726981785133915621882601398606457117831434047162367181808464229994553887686656 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade065Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade065Part02304 = 53835299136427017652647797259565063793726726124970071314834399777316436451246884251205092115251076217834569728 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade065Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade065Part02368 = 39673005349580336480576214545962097443105771826149520243899121578360478584683325769255321031344092065350811648 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade065Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade065Part02432 = 28747289488591832479778857253456044146949421400550814254282935892232416718388842628296007566582221888466976768 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade065Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade065Part02496 = 20426560855794075474511746759884685319273375147081614916701488631254381726201229890819231699761438929996218368 := by decide +kernel

theorem group_length : firstCenterIntegerGrade065Group004.size = 512 := by
  simp only [firstCenterIntegerGrade065Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade065Group004 = 592992170680212111954724652081075449816829232246753576889879731508683054463279290033618718647036360069918752768 := by
  simp only [firstCenterIntegerGrade065Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade065Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade065Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade065Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
