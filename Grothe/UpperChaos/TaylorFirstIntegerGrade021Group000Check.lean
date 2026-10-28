import Grothe.UpperChaos.TaylorFirstIntegerGrade021Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade021Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade021Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade021Part00000 = 5002232834380390119985324493396428465842379846935527464607885061017658850358612077441431905767518760992073490366464 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade021Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade021Part00064 = 2197572476338502865741636867981101872791509513432346025138158080336425084502534760583764336901062794754378474455040 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade021Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade021Part00128 = 736156355331309688599363385001306457573645816200394940727228661741841590906106698910741111004612473566824293728256 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade021Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade021Part00192 = 51185195236498931492267532114337931511489334999242920901635577758723383847070788931086008202072928834324141178880 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade021Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade021Part00256 = 8358203435417320040456593041437862181464239355949209915554895059670778206130341274522988953686054660600372396032 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade021Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade021Part00320 = 3199025990006440208634570940373994092382217925357915857313339827639661673344397063820316278758171039603617693696 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade021Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade021Part00384 = 2319695704538259846840181092139422807718600831301482167854174712561874083160564480405517526737223514472497283072 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade021Part00448.size = 58 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade021Part00448 = 1373525249404582538395946122225635953073857290954929955739182656819730331313517396237356883716941166101833711616 := by decide +kernel

theorem group_length : firstCenterIntegerGrade021Group000.size = 506 := by
  simp only [firstCenterIntegerGrade021Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade021Group000 = 8002397311666068208452919569689351642753663426971074889271368973111340953908273146082009541518165348528378720813056 := by
  simp only [firstCenterIntegerGrade021Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade021Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade021Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade021Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
