import Grothe.UpperChaos.TaylorSecondIntegerGrade040Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade040Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade040Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade040Part00000 = 1012746654915360219687861603994368008197082943156952142843173691380590591026139753761588775316084569798900449280 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade040Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade040Part00064 = 1418958976665585604935049661187745820965344423830303780716173765917844715507146226131117035266650135525364596736 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade040Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade040Part00128 = 390456923862171258793670223863871365260408989549672831342648046409142687927297611828098655617869241621384527872 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade040Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade040Part00192 = 436746222148433718442091611714521788234108360682038348024457620419205175154883052142590085218593822778763247616 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade040Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade040Part00256 = 152718259342623015022477435975387260802113064418936697738092612312427188120623209396867277795450930514351882240 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade040Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade040Part00320 = 145323428490851436795488605495168788738456691449305250955566180068757820844170841036537532900174356419069345792 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade040Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade040Part00384 = 96908284712700077901882157286640219731177735320760564891674753290574787679748886223717262310386903255191912448 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade040Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade040Part00448 = 57301070347495401334118675672051313421152778307531163559273977065170808962178773927151094982845735646116446208 := by decide +kernel

theorem group_length : secondCenterIntegerGrade040Group000.size = 512 := by
  simp only [secondCenterIntegerGrade040Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade040Group000 = 3711159820485220732912639975189754565349844986715500780071060646863713775222188354447667719408055695559142408192 := by
  simp only [secondCenterIntegerGrade040Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade040Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade040Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade040Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
