import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group010Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade071Group010Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade071Part05120.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade071Part05120 = 10247639024850839648467860036127184928756379482925070437717769659438389172026621186143167587495511941185536 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade071Part05184.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade071Part05184 = 3967288667397742436827865560848654664181506475724183640554054296344437631806405962668403603313098460495872 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade071Part05248.size = 8 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade071Part05248 = 154434170974171760393730037506698486173622123367686696353404719293661925247014145233570026709349526667264 := by decide +kernel

theorem group_length : firstCenterIntegerGrade071Group010.size = 136 := by
  simp only [firstCenterIntegerGrade071Group010, Array.size_append, len0, len1, len2]

theorem group_energy : energy firstCenterIntegerGrade071Group010 = 14369361863222753845689455634482538079111508082016940774625228675076488729080041294045141217517959928348672 := by
  simp only [firstCenterIntegerGrade071Group010, energy_append, sum0, sum1, sum2]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade071Group010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group010Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group010Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
