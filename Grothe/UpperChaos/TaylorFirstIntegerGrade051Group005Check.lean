import Grothe.UpperChaos.TaylorFirstIntegerGrade051Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade051Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade051Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade051Part02560 = 2063051621031906769046202728025900654113945114084659991811778375393064684979811039283698299472274996504559616 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade051Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade051Part02624 = 1460462006949321541539205326939220272456781996674840620050680657492197964246597534788280108527178060388106240 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade051Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade051Part02688 = 3236172689547977939606187115238110647785032064506598526768410430033047815266348916566126549901086901938421760 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade051Part02752.size = 4 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade051Part02752 = 1865464314230813996737338203717269960972185892487979774113551775099747371610567152915699334237623690419240960 := by decide +kernel

theorem group_length : firstCenterIntegerGrade051Group005.size = 196 := by
  simp only [firstCenterIntegerGrade051Group005, Array.size_append, len0, len1, len2, len3]

theorem group_energy : energy firstCenterIntegerGrade051Group005 = 8625150631760020246928933373920501535327945067754078912744421238018057836103324643553804292138163649250328576 := by
  simp only [firstCenterIntegerGrade051Group005, energy_append, sum0, sum1, sum2, sum3]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade051Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade051Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade051Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
