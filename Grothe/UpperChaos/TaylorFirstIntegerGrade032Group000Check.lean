import Grothe.UpperChaos.TaylorFirstIntegerGrade032Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade032Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade032Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade032Part00000 = 855598701263315525671172169511427485323485395733033479544478894980857197246964022476986440051414479187365179949056 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade032Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade032Part00064 = 480618008315646679174467132881246611016176807699728298996699636563565193079525884616977323728777261369591886512128 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade032Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade032Part00128 = 380073351204275117319387465789010895683268270828281665086161663276669497200793644001686214332880680787188778008576 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade032Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade032Part00192 = 451068352615713464303660734106562704214017086642731396646759606388043301992176176064159873011059037823722808410112 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade032Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade032Part00256 = 240320106858285345872018919084732004063186027911350096460961103685077415665476760247844175531896832945580670976000 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade032Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade032Part00320 = 82267367483340807539317602967426902901039505601591793944807383226221599109092028642728183545721385372126556454912 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade032Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade032Part00384 = 35072507325900414272219929294024690983725746635609123632986342183204214727546837834723809333353331725372921741312 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade032Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade032Part00448 = 20348189336525785307017458398200878313440453715389962568151006732416964256137429917853197833639828538638957805568 := by decide +kernel

theorem group_length : firstCenterIntegerGrade032Group000.size = 512 := by
  simp only [firstCenterIntegerGrade032Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade032Group000 = 2545366584403003139459261412032632172498339294767715816881005637036055383277712783802959217368742837749587759857664 := by
  simp only [firstCenterIntegerGrade032Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade032Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade032Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade032Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
