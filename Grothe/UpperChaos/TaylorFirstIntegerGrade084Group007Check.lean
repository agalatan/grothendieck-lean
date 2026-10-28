import Grothe.UpperChaos.TaylorFirstIntegerGrade084Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade084Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade084Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade084Part03584 = 3311647711888696125046922131859805310365547325981127421829892435739217308984753964699268676995495690797842432 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade084Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade084Part03648 = 2420592186310939694679895579782948062788004706823600796803849619710465599528666801657065536062187507516702720 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade084Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade084Part03712 = 9017290853886499199678256088621249602740441719912502922825056144772356166442623438177948251492328216199168 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade084Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade084Part03776 = 1730631412426267063115692606806104994652601206451719565921493186002951364474895827369195883571093609860038656 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade084Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade084Part03840 = 1226225048585592786179291106064996418514151601075973730864515908042332322056408591935853507814133093044846592 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade084Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade084Part03904 = 842167101356509308518629387414551203983548783649352841186577617211307896215567172073087956959173759102615552 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade084Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade084Part03968 = 2520251666270514807626730705570714681890208196013936531175904653283502452338722934810920862516001665712128 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade084Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade084Part04032 = 558975085063613330421319600951306270541202990762454878005867368382334566096787788630572725778550518892724224 := by decide +kernel

theorem group_length : firstCenterIntegerGrade084Group007.size = 512 := by
  simp only [firstCenterIntegerGrade084Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade084Group007 = 10101776088151775321969055399673904225129687264660155674066197095886664915975861492738033156294642509096681472 := by
  simp only [firstCenterIntegerGrade084Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade084Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
