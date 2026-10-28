import Grothe.UpperChaos.TaylorFirstIntegerGrade089Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade089Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade089Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade089Part04608 = 132617456659085480079213685142204750733925175949665913856411160885655352499757731575867163710576050105745408 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade089Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade089Part04672 = 72465584161995291907360787765286219392234113188334687983481099875565840613678146681152641161277982996692992 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade089Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade089Part04736 = 10188941303591034204921078269997787466246442939131348988141738071878048296842546222625959538843077192974336 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade089Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade089Part04800 = 58277703483130494817761823424320048748227664818136429419649896549730401349317522095839676844993353191784448 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade089Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade089Part04864 = 50494641333917745776796778749387553194699454224174955804781042106559608912900702308760166477769145432670208 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade089Part04928.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade089Part04928 = 1033088053406394763215045247643997844015443355076990592736842942531201290547958239819463509583356057616384 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade089Part04992.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade089Part04992 = 48295146151114898925665860915085651040144248695216960671448268121696098209084673207595376078875475056787456 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade089Part05056.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade089Part05056 = 46334475530958072967107149954574964465311527455391716654765648593032219196782786327955686092938417149050880 := by decide +kernel

theorem group_length : firstCenterIntegerGrade089Group009.size = 512 := by
  simp only [firstCenterIntegerGrade089Group009, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade089Group009 = 419707036677199413442042209468500972884804070625129003971415697146648770368912066659616133414856857183322112 := by
  simp only [firstCenterIntegerGrade089Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade089Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
