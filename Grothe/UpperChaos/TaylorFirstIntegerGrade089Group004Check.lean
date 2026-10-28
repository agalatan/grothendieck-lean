import Grothe.UpperChaos.TaylorFirstIntegerGrade089Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade089Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade089Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade089Part02048 = 138416402816793114172590139125745271978398500897864707854798527955834548234895383596413921042434668230984335360 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade089Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade089Part02112 = 298528022313496868438841911027289891545679270463480996155068095065445006779943221306807617614584609868087296 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade089Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade089Part02176 = 115870538219122206496445523877695708981017965801990983265709941427751177001645737702162010774380559188849852416 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade089Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade089Part02240 = 97125536240133746654759080045700183716084513008293869972145969886276755772108021902538703127805691697735663616 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade089Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade089Part02304 = 45358129600197747983283948051618650701303456499736281085277671809013869265824032747188207365206898505133588480 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade089Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade089Part02368 = 35763460077002164332810671999314102690202623920217980260549019487186251804992264576231051264873696986606338048 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade089Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade089Part02432 = 67742297769413468688793889170970441680588611106883942000452000753121580194998007198531179655899161333017346048 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade089Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade089Part02496 = 56506664074003219993259981276098568621813370078532499272040838872250749139724773993675505500794502902760603648 := by decide +kernel

theorem group_length : firstCenterIntegerGrade089Group004.size = 512 := by
  simp only [firstCenterIntegerGrade089Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade089Group004 = 557081556818979165190382075458170218260954720583983744707129038286500376420968164938047386349009763454955814912 := by
  simp only [firstCenterIntegerGrade089Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade089Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
