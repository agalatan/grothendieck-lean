import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group011Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade075Group011Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade075Part05632.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade075Part05632 = 19325536962457516093377312109513266467053532691490025638296468746563587228494899049615537605363949534969856 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade075Part05696.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade075Part05696 = 2156237594391346147691565913993014650547273343414246027575293269852299359906159159347784388709740242272256 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade075Part05760.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade075Part05760 = 6639627055719460267995935986279679494401051577904250809368865075104870613563652621196501281287921385603072 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade075Part05824.size = 28 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade075Part05824 = 3496117107532320147827068445505377324134459346348707319608648606332822894623057078049799931672365291798528 := by decide +kernel

theorem group_length : firstCenterIntegerGrade075Group011.size = 220 := by
  simp only [firstCenterIntegerGrade075Group011, Array.size_append, len0, len1, len2, len3]

theorem group_energy : energy firstCenterIntegerGrade075Group011 = 31617518720100642656891882455291337936136316959157229794849275697853580096587767908209623207033976454643712 := by
  simp only [firstCenterIntegerGrade075Group011, energy_append, sum0, sum1, sum2, sum3]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade075Group011Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group011Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group011Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
