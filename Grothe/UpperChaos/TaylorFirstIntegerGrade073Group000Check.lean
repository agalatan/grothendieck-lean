import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade073Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade073Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade073Part00000 = 6271729990681201931918680114377863204555562704609816302149909068535659659285715444116418483004460385032072069120 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade073Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade073Part00064 = 7888380811768618500026371286078273951374522271287969216401469867059865034409584235644415550002926746070186721280 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade073Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade073Part00128 = 9719641893251191373367097096737508801193776455114539492513447820770974954617609756091113679107135133750132736000 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade073Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade073Part00192 = 10992833780191466827932881041131493853635565173222161420816752911694488293949755031458502485692373885511213776896 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade073Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade073Part00256 = 11455733662131573885488693427639694647349304353663662099446325494822951930418495411968918367066626092764539912192 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade073Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade073Part00320 = 11041794406132056534060838971299876960159715056195781656619191102388922302730354792964929307477905338004230111232 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade073Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade073Part00384 = 1768276589357081490295475980148936982021221913269288969618349597270909037299273889547889868264865210280368406528 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade073Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade073Part00448 = 8115717750291511358675489476325072143288454279526879419666796156251821774885927622156162688330512125548807847936 := by decide +kernel

theorem group_length : firstCenterIntegerGrade073Group000.size = 512 := by
  simp only [firstCenterIntegerGrade073Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade073Group000 = 67254108883804701901765527393738720543578122206890098577232242018795592987596716183948350428946804916961551581184 := by
  simp only [firstCenterIntegerGrade073Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade073Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
