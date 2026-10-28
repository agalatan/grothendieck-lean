import Grothe.UpperChaos.TaylorFirstIntegerGrade086Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade086Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade086Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade086Part00512 = 2170773042800697550388903981407522616651335308053734684334952790274138169288058725516422814878402774232289247232 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade086Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade086Part00576 = 2021440704867435173212911276376842957820345748070193227905363205292050352594509628086109981703112971653226692608 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade086Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade086Part00640 = 1018853952071651979032856817941076093275997308346250867211881353505293471162483188104394110225533787706079838208 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade086Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade086Part00704 = 811028704717480048033121067824666520633764690912995383595136561559321934244961026415331605306620289566537416704 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade086Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade086Part00768 = 1672284908085785905712539403557349920550706336336222854521782422701323616714240425551924910689515097491190579200 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade086Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade086Part00832 = 1478039249453712550387221733766898415804854761282596844089949109341625711168667888711008627910160024646075809792 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade086Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade086Part00896 = 318493464923426872454915540644605167466353340274504470496551898260224919357382075521592147107181293477178638336 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade086Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade086Part00960 = 888277304111835143161212858033531963240904126180345798492554115190961010305426081743328775985001098060362678272 := by decide +kernel

theorem group_length : firstCenterIntegerGrade086Group001.size = 512 := by
  simp only [firstCenterIntegerGrade086Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade086Group001 = 10379191331032025222383682679552493655444261619456844130648171456124939184835729039650112973805527336832940900352 := by
  simp only [firstCenterIntegerGrade086Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade086Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
