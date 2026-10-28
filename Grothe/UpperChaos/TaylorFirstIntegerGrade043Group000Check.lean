import Grothe.UpperChaos.TaylorFirstIntegerGrade043Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade043Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade043Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade043Part00000 = 511676481696464943329057720091001935054330796023701931152973820818751838684534526138761846310112903329345613856768 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade043Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade043Part00064 = 491706524385841096836680242480552364938386354359989537690105501928859486953993622999888363973299657353921069842432 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade043Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade043Part00128 = 1196868026908558817634004630190886957083979938156745234406793293703495832531445912996746382059082330927121794334720 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade043Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade043Part00192 = 592820504583980675351567925861063185970935556016058838456195414234631456768060870393181488811695593142581821702144 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade043Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade043Part00256 = 859594205312299933276533521216415972646804275746090928052861212495280019700334422077986456010716824628358734151680 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade043Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade043Part00320 = 223310759448442512750721522601915269625911636372930509180516886871450306872273005210308110368508615113271855284224 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade043Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade043Part00384 = 181984778146313073266595133054446392394173663140988239441345107000647175014508519165975802452331126672459464441856 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade043Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade043Part00448 = 79247089936687695421961674338061376412139112428207814125429672688407229751900128408874737813835453582074879934464 := by decide +kernel

theorem group_length : firstCenterIntegerGrade043Group000.size = 512 := by
  simp only [firstCenterIntegerGrade043Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade043Group000 = 4137208370418588747867122369834343454126661332244713032506220909741523346277051007391723187799582504749135233548288 := by
  simp only [firstCenterIntegerGrade043Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade043Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade043Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade043Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
