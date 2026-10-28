import Grothe.UpperChaos.TaylorFirstIntegerGrade025Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade025Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade025Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade025Part00512 = 1761741552935335656207791522696530883034396813508204260294421510761544511302379170504336148522751076115532480512 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade025Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade025Part00576 = 957717738574359865701569068250225976215033635369829581716657352871274690936108559488274333118213333997437583360 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade025Part00640.size = 62 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade025Part00640 = 561591867395427230479672908907103537396010761324997969363854832911270011917501170512780552066061600412804317184 := by decide +kernel

theorem group_length : firstCenterIntegerGrade025Group001.size = 190 := by
  simp only [firstCenterIntegerGrade025Group001, Array.size_append, len0, len1, len2]

theorem group_energy : energy firstCenterIntegerGrade025Group001 = 3281051158905122752389033499853860396645441210203031811374933696544089214155988900505391033707026010525774381056 := by
  simp only [firstCenterIntegerGrade025Group001, energy_append, sum0, sum1, sum2]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade025Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade025Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade025Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
