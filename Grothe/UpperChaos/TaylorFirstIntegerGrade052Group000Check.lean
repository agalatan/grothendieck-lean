import Grothe.UpperChaos.TaylorFirstIntegerGrade052Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade052Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade052Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade052Part00000 = 204868249277147068754665059720162195883084753645644145771552610452886889574596620891325395519174577079773871210496 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade052Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade052Part00064 = 124617988746833404128687713506131138557465391681135068042343091216346072787603093606420949890638165577882272792576 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade052Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade052Part00128 = 89204248749035522876932520200403249820334522010117323554956507005295254845071935272423620669295354271872321585152 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade052Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade052Part00192 = 66087073443115291291931119114262949927005327615236727196982709891894688763127218957848035220104964191527345586176 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade052Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade052Part00256 = 107514059181085856797375948387184503446121894787326187407475756369655511024461271214755545485616275675168725008384 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade052Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade052Part00320 = 154014101998516584067613508073894609274750075593957350187833060446736862434883768636313796736556280184635975008256 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade052Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade052Part00384 = 89986206480445997187813774559522324179808211043511054848341031937139230283587175807964278955302203643910787432448 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade052Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade052Part00448 = 68208891536903125420699004438143384450908866108417433915701389332144026713223520130419081787969994206021207195648 := by decide +kernel

theorem group_length : firstCenterIntegerGrade052Group000.size = 512 := by
  simp only [firstCenterIntegerGrade052Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade052Group000 = 904500819413082850525718647999704355539479042485345290925186156652098536426554604517470704264657814830792505819136 := by
  simp only [firstCenterIntegerGrade052Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade052Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade052Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade052Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
