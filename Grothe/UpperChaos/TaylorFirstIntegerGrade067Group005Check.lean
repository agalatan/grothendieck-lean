import Grothe.UpperChaos.TaylorFirstIntegerGrade067Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade067Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade067Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade067Part02560 = 13069447860916545197338358852192516016131631649895247180425333419109600691069993295052639908348298806480076800 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade067Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade067Part02624 = 6127405915104219523926965290381829862568760735407620108615163313638832491555064147699971133576991167026823168 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade067Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade067Part02688 = 12563135717321237711233409593522046685728058062076738744112865075488106568489127193741226287398498589667753984 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade067Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade067Part02752 = 9108407880707080132374429971772954611162114889889357939339353102124330304034712934920611189187368962089811968 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade067Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade067Part02816 = 6237823747530679979574409440868689948730312490445223961284333051364239478416536273674818693557314678113173504 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade067Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade067Part02880 = 4235848742200508045595213497893002601313450294817618349873463608154698765395516111596333121288387232108904448 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade067Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade067Part02944 = 2844788752556342302452276879134044294813684056126077176500811340092088469108287528140673116179048534762323968 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade067Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade067Part03008 = 1865946906824718400961457521095899286074900042364496884301030417332575012907195300135313505798812656941924352 := by decide +kernel

theorem group_length : firstCenterIntegerGrade067Group005.size = 512 := by
  simp only [firstCenterIntegerGrade067Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade067Group005 = 56052805523161331293456521046860983306522912221022380344452353327304471780976432784961586955334720627190792192 := by
  simp only [firstCenterIntegerGrade067Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade067Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade067Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade067Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
