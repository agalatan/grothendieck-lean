import Grothe.UpperChaos.TaylorFirstIntegerGrade088Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade088Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade088Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade088Part00000 = 1467555835255838399591138475398848499773659572426375998451752977781032741852565149189353809397511858179312451584 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade088Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade088Part00064 = 1293834860188115514898937016006090988062228637656188875377244747758463229796347780975308864969028651347816578624 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade088Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade088Part00128 = 1628049504811961083991333393007834606315574777024218998958068233013877462492345203431908768611888367604317814784 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade088Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade088Part00192 = 9462890869173311101124657738009674441786802159094177437046235791233164870683473912795531004031275577676660736 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade088Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade088Part00256 = 1751012941073741796658590530508274569179680618449050798140079761257400125862003667094983926424989596982230122496 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade088Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade088Part00320 = 1805003360755629229152478655599749164995055461469278281967375629180564714511052915671841653164436230049231798272 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade088Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade088Part00384 = 19108080298388148566122631676936550388727223752190913975569139661154270622999653929854655179755332830542954496 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade088Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade088Part00448 = 1821514175986111624472907009154864552134029098209693625556505527407967537301795021344332320647180603597569130496 := by decide +kernel

theorem group_length : firstCenterIntegerGrade088Group000.size = 512 := by
  simp only [firstCenterIntegerGrade088Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade088Group000 = 9795541649238959108432632369090608605290742191146091669863642251851693247309792865550379529398821916168697511488 := by
  simp only [firstCenterIntegerGrade088Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade088Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
