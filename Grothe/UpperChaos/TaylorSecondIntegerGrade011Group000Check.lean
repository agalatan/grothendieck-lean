import Grothe.UpperChaos.TaylorSecondIntegerGrade011Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade011Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade011Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade011Part00000 = 66934730393892072959547394464678236632763721554137994941451955141640974498772661846996255952968841941131953438720 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade011Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade011Part00064 = 2178824210779427345522967721372962770227472604329374966376425182655150607727063936062569827895428766553241288704 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade011Part00128.size = 28 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade011Part00128 = 267849264663598556303979149659701085849530106207816420575279506264501176895539489560876314900877324395862818816 := by decide +kernel

theorem group_length : secondCenterIntegerGrade011Group000.size = 156 := by
  simp only [secondCenterIntegerGrade011Group000, Array.size_append, len0, len1, len2]

theorem group_energy : energy secondCenterIntegerGrade011Group000 = 69381403869335098861374341335710900488840724264675186328403659830560626283395265272619702095765148032081057546240 := by
  simp only [secondCenterIntegerGrade011Group000, energy_append, sum0, sum1, sum2]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade011Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade011Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade011Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
