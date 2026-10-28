import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade079Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade079Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade079Part04608 = 59879357063602388008121998946101993940520988985905365557696228121014155886715392288139002370825705473703936 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade079Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade079Part04672 = 54973668661239121835710959800544229306692435261687191629936114578781713225430020919715577765783796946305024 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade079Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade079Part04736 = 45813426828183597972955743239026363051734740430717477257195976638047478037374446875160075991123239695810560 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade079Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade079Part04800 = 29706822197490408871101072964884672735846614051858138980821221891941896833371178807717215822560013144031232 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade079Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade079Part04864 = 6847676350748014771691528656588899383192761146407311607327647320994323284704901881725014169196361565601792 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade079Part04928.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade079Part04928 = 30425119071893762162131723160804500889724489728214140593380637151522364270332826978783296665652748582125568 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade079Part04992.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade079Part04992 = 26286867805579152172806771723549542379738532412832260996506825290775417803174997403002103287657248979943424 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade079Part05056.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade079Part05056 = 20608840663317333541813612980602782632083514181964737060189039074413209897082670745957163679529350083903488 := by decide +kernel

theorem group_length : firstCenterIntegerGrade079Group009.size = 512 := by
  simp only [firstCenterIntegerGrade079Group009, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade079Group009 = 274541778642053779336333411472102984319534076199586623683053690067490559238186435900199449752328464471425024 := by
  simp only [firstCenterIntegerGrade079Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade079Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
