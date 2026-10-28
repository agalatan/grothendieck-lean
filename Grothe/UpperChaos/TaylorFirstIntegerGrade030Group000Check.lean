import Grothe.UpperChaos.TaylorFirstIntegerGrade030Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade030Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade030Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade030Part00000 = 1262403832931048102894668439892247856071379912598772354229180065892493473112123823791436816822555774018103359307776 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade030Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade030Part00064 = 1155086754352583735513547610730460309066395530526726914363712461038278443998574422283806299712066825918764044779520 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade030Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade030Part00128 = 713570861306100933546112109721217351663411430273663405824252721093901407516530139700529697740240477723164126740480 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade030Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade030Part00192 = 308939931341003292832732988312508812453764735141789547012509891032076005526806829317517756069876021651956513636352 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade030Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade030Part00256 = 115479889110253602897010238122576311251032853418117433605327558093513864159393440841371701105279189296637399793664 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade030Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade030Part00320 = 56170461022440744496662769166563184486810962000330352554812675609382054236366173624033064061213375031869309976576 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade030Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade030Part00384 = 25369096637038419870692373128979705219193904627310376235881780086575600024592561780398623714995569719908457512960 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade030Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade030Part00448 = 9339188112944209436770047674802740452403810950080069315405855997345351614014845868815282443581280649311814680576 := by decide +kernel

theorem group_length : firstCenterIntegerGrade030Group000.size = 512 := by
  simp only [firstCenterIntegerGrade030Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade030Group000 = 3646360014813413041488196576749356270664393139536790453141083008843566200188402237207909241669808514009715026427904 := by
  simp only [firstCenterIntegerGrade030Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade030Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade030Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade030Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
