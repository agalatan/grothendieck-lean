import Grothe.UpperChaos.TaylorFirstIntegerGrade043Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade043Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade043Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade043Part01024 = 562854764264942932160803148292096634872896057226570927074146502515144198040163379003949971872982715193861603328 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade043Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade043Part01088 = 217528685400071910671271348891847411057285584841811314430666400618865801191461388509876582343277938652661940224 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade043Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade043Part01152 = 314260925506351710197832453335091099859633135683891706515592640679426811302926463617389429433856880701448650752 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade043Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade043Part01216 = 168057729863229925817508709730407613882330935728300913081793489289667158158190160298547801797008678691031482368 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade043Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade043Part01280 = 133300687206976166066507691538904804265335885339179060156521718211020369435572818277511379225164117939064930304 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade043Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade043Part01344 = 206814435469881506718540277107630384495625546005071260524972817162041242484136479766137933954044940436459487232 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade043Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade043Part01408 = 67498563178518388683788569075568480955179653536575174793878887326782158857496013126479864242234099136888569856 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade043Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade043Part01472 = 82874418830995771128881407867991080673493258627250238816422049270873840496470788114102360822232070264222384128 := by decide +kernel

theorem group_length : firstCenterIntegerGrade043Group002.size = 512 := by
  simp only [firstCenterIntegerGrade043Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade043Group002 = 1753190209720968311445133605839537510061780056988650595393994505073821579966417490713995323690801441015639048192 := by
  simp only [firstCenterIntegerGrade043Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade043Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade043Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade043Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
