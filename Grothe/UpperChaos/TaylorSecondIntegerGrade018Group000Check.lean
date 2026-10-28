import Grothe.UpperChaos.TaylorSecondIntegerGrade018Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade018Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade018Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade018Part00000 = 41491301752633557200107567735430276138554838538520669032587509371016057191108362272859561742800889202186213392384 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade018Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade018Part00064 = 2560251063020695860119297419934636326694425380702945953489498194016644272194026252953979083204769704843243683840 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade018Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade018Part00128 = 1223027823771989669509974219165488351380118769839129878683311521530784226390620970027869897599699272987574272000 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade018Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade018Part00192 = 717962323617716834850660202991422428024398321323464646345210523496763862082400293768158727968012714233703694336 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade018Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade018Part00256 = 315789548997146588871779654960801619141419825606570596758691382608259849794785303596160139041974497627340800000 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade018Part00320.size = 60 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade018Part00320 = 138146149768757323281853159581796692460760132320144294445279835332819391672214015663645540403500962531487252480 := by decide +kernel

theorem group_length : secondCenterIntegerGrade018Group000.size = 380 := by
  simp only [secondCenterIntegerGrade018Group000, Array.size_append, len0, len1, len2, len3, len4, len5]

theorem group_energy : energy secondCenterIntegerGrade018Group000 = 46446478661809863476741132392064421556255960968312924402309500828001328793242409108869375131018846354409563095040 := by
  simp only [secondCenterIntegerGrade018Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade018Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade018Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade018Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
