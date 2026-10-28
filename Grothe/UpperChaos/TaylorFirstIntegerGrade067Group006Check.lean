import Grothe.UpperChaos.TaylorFirstIntegerGrade067Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade067Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade067Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade067Part03072 = 1242955453927082324786275653765520172749783514880133970246585923838243433912723151248894812100166909652107264 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade067Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade067Part03136 = 953142964777014383956995056964499681586451138206690163081674366823810036764169348233779548492223327135334400 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade067Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade067Part03200 = 853656504275676811302725327937932874849773783860364636068228994383569104647930352870857647221275594214866944 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade067Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade067Part03264 = 776992500225850147028440506016103929864937114895818165414245572768771306353953975723420942354404231216103424 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade067Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade067Part03328 = 669558958820264383747287550700753180230302262033690176968499636529211752036930908559816951030337834867228672 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade067Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade067Part03392 = 562348928518137673684334140124425379696140953770568070674588385358145758920553198212569001661921150468358144 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade067Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade067Part03456 = 266467509957679268700735487790209687673226304263400170386128943761706386095872428367357876659100123853225984 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade067Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade067Part03520 = 285392887737525828432616218244066327480671934073923647421702528834210380490766324695781047289546864687316992 := by decide +kernel

theorem group_length : firstCenterIntegerGrade067Group006.size = 512 := by
  simp only [firstCenterIntegerGrade067Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade067Group006 = 5610515708239230821639409941543511234131287005984589000261654352297668159222899687912477826808976036094541824 := by
  simp only [firstCenterIntegerGrade067Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade067Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade067Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade067Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
