import Grothe.UpperChaos.TaylorFirstIntegerGrade044Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade044Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade044Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade044Part01024 = 625845832383599483650089922748704621245949499108175951016256608088063750554302810515210964046330113584296624128 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade044Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade044Part01088 = 698039399297102199984272499256113069003281568152633714091466110694058765227274901418192676969989318541167296512 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade044Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade044Part01152 = 272152941140072521513099847823823617910862431965133398223373590319535411854276126316978826591217787815677919232 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade044Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade044Part01216 = 188732795598046320672348775313732644594930297021327200787594570931152182524187902908865286540089816479864717312 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade044Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade044Part01280 = 279241095758742846329570509471582236727005391364625988726392031189783873130986606630555771792131865040138534912 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade044Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade044Part01344 = 136668328056438716926398955203631432550317935036053143746570631218639396094867460981009341498205787388576268288 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade044Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade044Part01408 = 163394956005577373566484740253825978238001512073656182373445921585810926233588796015111594536984692074745954304 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade044Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade044Part01472 = 95514297398195261938026280599161931043775969891810530653915511666105924156610325477378072736193781798533070848 := by decide +kernel

theorem group_length : firstCenterIntegerGrade044Group002.size = 512 := by
  simp only [firstCenterIntegerGrade044Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade044Group002 = 2459589645637774724580291530670575531314124604613416109619014975693150229776094930263302534711143162723000385536 := by
  simp only [firstCenterIntegerGrade044Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade044Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade044Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade044Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
