import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade072Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade072Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade072Part02048 = 172166369924264626328033338686561252713722642661834794741559566229566480760385518449789755671791555811460775936 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade072Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade072Part02112 = 138274188278541672184072902061208370079868675521991203349109937324377537161851554303494079084765035369938812928 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade072Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade072Part02176 = 110947087568387315024934243414550735947112890592018860595942023550673016801195881857811493485262719576929468416 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade072Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade072Part02240 = 88770174975427651966098581568940140901044621851645903976351166400746837909447481073362815498249673014010445824 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade072Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade072Part02304 = 18254921439272773121682152355955938531573199332919052043438477510371157688542263006172171820377499685529583616 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade072Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade072Part02368 = 52484929462912320363565670349646469052645093522499135394312941154416444718578777645197543347416136594833276928 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade072Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade072Part02432 = 56051805195343928639648519680402433571164080743749786869446414491097683822861941134792373322702669428446724096 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade072Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade072Part02496 = 44153030903909338057279851660228369757410131547029088812802805642565818649477201909779438636180516334244724736 := by decide +kernel

theorem group_length : firstCenterIntegerGrade072Group004.size = 512 := by
  simp only [firstCenterIntegerGrade072Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade072Group004 = 681102507748059625685315259777493710554541335773687825782963332303814977512340619380399670866745805815393812480 := by
  simp only [firstCenterIntegerGrade072Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade072Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
