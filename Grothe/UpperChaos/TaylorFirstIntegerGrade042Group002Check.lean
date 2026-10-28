import Grothe.UpperChaos.TaylorFirstIntegerGrade042Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade042Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade042Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade042Part01024 = 181765290036694861239525032651419962514603236412552461421620741674229408849182124240034447071565743129431638016 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade042Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade042Part01088 = 344212597487975353594978455151399259934797642519273681959003096464545528762794517701962067641726690234627784704 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade042Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade042Part01152 = 145155944319231633907022925725615048388370916869933092579404705026114528131322255324735370014561009042504810496 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade042Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade042Part01216 = 246749494664666627417670593059040088068454254266677580868846489718042215620868364585974216336130563418422771712 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade042Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade042Part01280 = 103794693555875738809651266519586951609348231509794228987080560959263150578349089530894559089308677267521536000 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade042Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade042Part01344 = 106298253727864238991552098865673866251327410020315918285004833690027202182748883180281795440949968710620151808 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade042Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade042Part01408 = 87686536342150729651203355117356752622177257389600404415663703378777457003011347914433207622403682927753822208 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade042Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade042Part01472 = 46185170304032068200943849917604829239142375496862643061017644264086940179611437799304754934985210303310987264 := by decide +kernel

theorem group_length : firstCenterIntegerGrade042Group002.size = 512 := by
  simp only [firstCenterIntegerGrade042Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade042Group002 = 1261847980438491251812547577007696758628221324485010011577641775175086431307888020277620418151631545034193502208 := by
  simp only [firstCenterIntegerGrade042Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade042Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade042Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade042Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
