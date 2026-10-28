import Grothe.UpperChaos.TaylorFirstIntegerGrade088Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade088Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade088Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade088Part00512 = 1870072577479315734456557248074182741444583053438235154201137351424392830664034496772498098527122387517036298240 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade088Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade088Part00576 = 1783865703665325519001378115439312468480270291670666627004845476227112909178752721266680780377683993338302169088 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade088Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade088Part00640 = 11279845057363560015253904261663581351043022690619678937566437177347066047517049575622794693799371156385431552 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade088Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade088Part00704 = 1615930683821892362282105883914953894070278968883848691890190908641606189972273478960000197995817068825638076416 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade088Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade088Part00768 = 1434932003191472793267845135278942449361457602679850719766546167412996038238484549880469319262164552607707693056 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade088Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade088Part00832 = 794380172412131820443905212624670182591496715408424222673502286174437928047471290025434172656864241640301133824 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade088Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade088Part00896 = 482483397066598639188228468672242160200909005988445405871372036276656887391749557286095375987654238449654824960 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade088Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade088Part00960 = 1081995964034151557599305613936053128277851292040872758981519839160079379222404134097205221692678035195559936000 := by decide +kernel

theorem group_length : firstCenterIntegerGrade088Group001.size = 512 := by
  simp only [firstCenterIntegerGrade088Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade088Group001 = 9074940346728251986254579582202020605777889952800963259326680502494629228762687277864005961193783888730585563136 := by
  simp only [firstCenterIntegerGrade088Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade088Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
