import Grothe.UpperChaos.TaylorFirstIntegerGrade040Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade040Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade040Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade040Part01024 = 186302391421006982436320667102740371973446398460421089836672807395196221642173258912733689996160317203085787136 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade040Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade040Part01088 = 291426752596183590746687635243854286032504082419486686500147322107505844315956936905736342889401801987047030784 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade040Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade040Part01152 = 162563892677210779498593245779559270409475045646444306007847501661989897594558535520237469154668721595035418624 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade040Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade040Part01216 = 222775703855166715851561513977191612965873093154777150305637932655999952901799661807217066665379594864867409920 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade040Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade040Part01280 = 118480478340300074861117364836836472787795080143694314171329898819141928420140289301657900652065781778325962752 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade040Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade040Part01344 = 71129220588637630730088545517392077441729032373777050244406495715506450837612944675350061345274853990554664960 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade040Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade040Part01408 = 53749345983737943960697704976802879773103971793558143360225790637340496922968959919100975402278369795980132352 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade040Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade040Part01472 = 16114415739858260798445299606573553781642361246130541708092337358012421480824213289115755801947474704094724096 := by decide +kernel

theorem group_length : firstCenterIntegerGrade040Group002.size = 512 := by
  simp only [firstCenterIntegerGrade040Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade040Group002 = 1122542201202101978883511977040950525165569065238289282134360086350693214116034800331149261907176915918991130624 := by
  simp only [firstCenterIntegerGrade040Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade040Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade040Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade040Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
