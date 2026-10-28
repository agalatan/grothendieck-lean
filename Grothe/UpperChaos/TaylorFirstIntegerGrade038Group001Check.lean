import Grothe.UpperChaos.TaylorFirstIntegerGrade038Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade038Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade038Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade038Part00512 = 17179211577931777801054498531266796434061282894107795479913685395702703843388412140109756159866794558492560588800 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade038Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade038Part00576 = 9550630486597512518360491416907902720291807089547288376974799459755497128550760716094723827156250303383660920832 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade038Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade038Part00640 = 5148455008699965876631660764145752928064116384632405264339241966299420098595144057010946531602375405865688629248 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade038Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade038Part00704 = 4009197303730354961787661857418442151713174583509361420836131392123047384475976233106239269673369416890511785984 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade038Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade038Part00768 = 1127975390878000270938552655311273114307363005873957615517700463326409132330886316147576040149433856835742334976 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade038Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade038Part00832 = 727910800843853406691520469268327432725432341188147298228554426129990458822572099915194310168699399804221915136 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade038Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade038Part00896 = 383949881916682183160408948853250403034895811432736478915036630819345429323281618499970121307050737802781130752 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade038Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade038Part00960 = 285748850111834303080078480022411737677542138125336178506380023049189968379729934335886386011368814682115670016 := by decide +kernel

theorem group_length : firstCenterIntegerGrade038Group001.size = 512 := by
  simp only [firstCenterIntegerGrade038Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade038Group001 = 38413079300709981321704873123194156921875614248417028113231529757205603443866763115220292645935342493757282975744 := by
  simp only [firstCenterIntegerGrade038Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade038Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade038Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade038Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
