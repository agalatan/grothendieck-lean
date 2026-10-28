import Grothe.UpperChaos.TaylorFirstIntegerGrade014Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade014Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade014Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade014Part00000 = 18016727936367810362626150135467400854244529169317896709871862986596571236427952704310089943560590621224563657146368 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade014Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade014Part00064 = 1105498340336058837842700716238641264074913592336045235027473365304686825741188528883824841092398541677746385321984 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade014Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade014Part00128 = 17148343285018882312333043055893049937556427406891811777007099778281551969572879890614999165481631221438375526400 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade014Part00192.size = 48 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade014Part00192 = 4213493323082792679668629726788060514705969656068681876265914270589390640978446032090307755845989349613344129024 := by decide +kernel

theorem group_length : firstCenterIntegerGrade014Group000.size = 240 := by
  simp only [firstCenterIntegerGrade014Group000, Array.size_append, len0, len1, len2, len3]

theorem group_energy : energy firstCenterIntegerGrade014Group000 = 19143588113311970875460852524488723228771705158716902438552609365950129004779692559116620091574316783473361762123776 := by
  simp only [firstCenterIntegerGrade014Group000, energy_append, sum0, sum1, sum2, sum3]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade014Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade014Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade014Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
