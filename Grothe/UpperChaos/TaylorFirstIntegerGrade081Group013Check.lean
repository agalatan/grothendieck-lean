import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group013Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade081Group013Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade081Part06656.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade081Part06656 = 7148755165926669335406575735122097488520501024069557953449649952040914038968654468906999791719045190909952 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade081Part06720.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade081Part06720 = 524079144791877941986306094376588267110257113540065447829608259617459904267263106499150221043907319300096 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade081Part06784.size = 22 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade081Part06784 = 2419738362770863364023037719975642500105771314718238683841761684191687701804177721211623646442276402495488 := by decide +kernel

theorem group_length : firstCenterIntegerGrade081Group013.size = 150 := by
  simp only [firstCenterIntegerGrade081Group013, Array.size_append, len0, len1, len2]

theorem group_energy : energy firstCenterIntegerGrade081Group013 = 10092572673489410641415919549474328255736529452327862085121019895850061645040095296617773659205228912705536 := by
  simp only [firstCenterIntegerGrade081Group013, energy_append, sum0, sum1, sum2]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade081Group013Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group013Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group013Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
