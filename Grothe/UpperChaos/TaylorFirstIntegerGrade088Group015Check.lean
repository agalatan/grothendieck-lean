import Grothe.UpperChaos.TaylorFirstIntegerGrade088Group015Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade088Group015Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade088Part07680.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade088Part07680 = 16900470230757283819163377979398152959766681426272174650514727703664696739935611441461701201306452563591168 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade088Part07744.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade088Part07744 = 171393071367022784956680762580645743321347561206311355286816052412961237581303013737004599724968574451712 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade088Part07808.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade088Part07808 = 11587542095599776873831955149819803132405325980133433946948882510916437486924786172327671122040013710163968 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade088Part07872.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade088Part07872 = 5753336015723909855008125015650363974568376627371792211969192178284761207351114845510804222676034983821312 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade088Part07936.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade088Part07936 = 2393338481931334155779079717806427715076499423882865913463217764692347834908971077381275828702920864432128 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade088Part08000.size = 10 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade088Part08000 = 38055527462164797877426542123740484995758786619859909601852377519102848295990440891484317755304329609216 := by decide +kernel

theorem group_length : firstCenterIntegerGrade088Group015.size = 330 := by
  simp only [firstCenterIntegerGrade088Group015, Array.size_append, len0, len1, len2, len3, len4, len5]

theorem group_energy : energy firstCenterIntegerGrade088Group015 = 36844135422841492286616645167379134010133989805486437987784688587490307354997776991309941292205695026069504 := by
  simp only [firstCenterIntegerGrade088Group015, energy_append, sum0, sum1, sum2, sum3, sum4, sum5]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade088Group015Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group015Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group015Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
