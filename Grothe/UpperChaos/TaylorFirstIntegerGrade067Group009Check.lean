import Grothe.UpperChaos.TaylorFirstIntegerGrade067Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade067Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade067Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade067Part04608 = 12032376832708770805197210184903761117551200511546277022389593029622517197438837783522812370736576131497984 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade067Part04672.size = 20 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade067Part04672 = 5096546785196120382975774518873345533319669434416666932663831653643669002895499164102637323281521247780864 := by decide +kernel

theorem group_length : firstCenterIntegerGrade067Group009.size = 84 := by
  simp only [firstCenterIntegerGrade067Group009, Array.size_append, len0, len1]

theorem group_energy : energy firstCenterIntegerGrade067Group009 = 17128923617904891188172984703777106650870869945962943955053424683266186200334336947625449694018097379278848 := by
  simp only [firstCenterIntegerGrade067Group009, energy_append, sum0, sum1]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade067Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade067Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade067Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
