import Grothe.UpperChaos.TaylorFirstIntegerGrade070Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade070Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade070Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade070Part00000 = 13126449073479347270522297169783613012875575351376199394352420599063789016910055013055009915507551061608602009600 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade070Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade070Part00064 = 15793039725740975515960699383163438294243767030593921739308515483894922057518124491809094030756029320172186632192 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade070Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade070Part00128 = 18974062353480713147046495972282551393286421050484547844881289296219471140742585390521928606469109465204660371456 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade070Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade070Part00192 = 20383587071154863199265594340791192821894312553712547820941740664575194546770100958610035884474170324066313961472 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade070Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade070Part00256 = 20428699977655186125710748614637282654107313378602984688278988430798861549239193549943258350620167365684849803264 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade070Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade070Part00320 = 18940804471253829425297843002028922527176185052277382734901021493891617626323210499755128885694246648487599931392 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade070Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade070Part00384 = 16375844887599974210298653550144785399641961898972078010672575407620580172100080018493644965024339981484293095424 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade070Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade070Part00448 = 13424932543671918081188040562436769191443656028042693344639266640607659675385656743204377538012277499364158472192 := by decide +kernel

theorem group_length : firstCenterIntegerGrade070Group000.size = 512 := by
  simp only [firstCenterIntegerGrade070Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade070Group000 = 137447420104036806975290372595268555294669192344062355577975818016672095784989006665392478176557891666072664276992 := by
  simp only [firstCenterIntegerGrade070Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade070Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade070Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade070Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
