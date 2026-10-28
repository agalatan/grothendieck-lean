import Grothe.UpperChaos.TaylorFirstIntegerGrade065Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade065Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade065Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade065Part01536 = 1183231039756513903691721119969270265570062066182563883942008618562459433857328628285321238246911707474089213952 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade065Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade065Part01600 = 938601682619156796452921909032377919749634022097327589793597141342934007085307610163302169456806872518030786560 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade065Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade065Part01664 = 730563408941801539884526872703882371393375417311046219233206660400412256985191034766885440639525275858674647040 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade065Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade065Part01728 = 565010127140162642778895514274201646062034840111321796932478303950984832265846756031132021200934908285432102912 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade065Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade065Part01792 = 436706238797196252086335708539841008859149186153242331850825922196709258396932880107468960889644072855771545600 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade065Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade065Part01856 = 338446847557397969952660533465486341720035476585924618159460426764318167432445918883489529899938321410167930880 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade065Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade065Part01920 = 263242323995835914243695937922653569668244286187989711103066558424291135575513133138020750264582162228042530816 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade065Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade065Part01984 = 205173319644920855991066124640193063735084168090713295031581462637497133748529137365622022789566978365400809472 := by decide +kernel

theorem group_length : firstCenterIntegerGrade065Group003.size = 512 := by
  simp only [firstCenterIntegerGrade065Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade065Group003 = 4660974988452985875081823720547906186757619462720129446046225094279606225347095098741242133387910298995609567232 := by
  simp only [firstCenterIntegerGrade065Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade065Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade065Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade065Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
