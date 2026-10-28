import Grothe.UpperChaos.TaylorFirstIntegerGrade090Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade090Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade090Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade090Part02048 = 3567847296631217155307961682524137281014372927575489210273426632555595473174669558830471336567651399750385664 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade090Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade090Part02112 = 128283911486075622382273309446117930988547606816942647468094015544988668220455707456121906951492527419882995712 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade090Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade090Part02176 = 110706679971074065140767358157550028745650971777325518060773815758994050137561376302750175673707419057082335232 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade090Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade090Part02240 = 89612423960731947479865172029993968883588551505970670017557087775848934421856622235708063357882060955656912896 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade090Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade090Part02304 = 2841411279668313267178219298074523262545245096691894462313694290811391975735563452602018132689382576710746112 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade090Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade090Part02368 = 77094755871664403936210545531844381413452800751498706576505395408539663332960081768095415115747438946102018048 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade090Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade090Part02432 = 64336491280720308143994154957110369195526636898389998809072978741473867114969967740912841555777105740754321408 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade090Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade090Part02496 = 6146274008795166752030152583425064217531745772703012522501757054357426335128185289583050174495445552726016 := by decide +kernel

theorem group_length : firstCenterIntegerGrade090Group004.size = 512 := by
  simp only [firstCenterIntegerGrade090Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade090Group004 = 476449667420574672672348751255798764834543717520167627617112915910266528103049116700310475174038081541492441088 := by
  simp only [firstCenterIntegerGrade090Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade090Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
