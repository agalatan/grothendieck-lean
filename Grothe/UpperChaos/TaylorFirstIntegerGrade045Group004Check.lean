import Grothe.UpperChaos.TaylorFirstIntegerGrade045Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade045Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade045Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade045Part02048 = 10515990264438432816762083950529470222548595681043376443340244002568172578334331365928783291357288818785910784 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade045Part02112.size = 50 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade045Part02112 = 9460831947292758648545894263824107732401755106108761716975244449287423324338496854578380507978998528744620032 := by decide +kernel

theorem group_length : firstCenterIntegerGrade045Group004.size = 114 := by
  simp only [firstCenterIntegerGrade045Group004, Array.size_append, len0, len1]

theorem group_energy : energy firstCenterIntegerGrade045Group004 = 19976822211731191465307978214353577954950350787152138160315488451855595902672828220507163799336287347530530816 := by
  simp only [firstCenterIntegerGrade045Group004, energy_append, sum0, sum1]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade045Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade045Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade045Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
