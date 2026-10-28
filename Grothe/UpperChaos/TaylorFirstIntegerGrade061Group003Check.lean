import Grothe.UpperChaos.TaylorFirstIntegerGrade061Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade061Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade061Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade061Part01536 = 953984208616854771820337884895915584601971016161296707219544876144039645741764931620489560194231481329738842112 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade061Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade061Part01600 = 717948665453496660172823583346332879978683158051681300741174266233537143628900771313800159044061213954502819840 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade061Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade061Part01664 = 542499926843350188687520988930418954049312586870267655310946941315431405900870530129057515953294788794431569920 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade061Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade061Part01728 = 412823728287893527070294441702033709474674618912273251333983275794538657029299787989966216363445985226090610688 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade061Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade061Part01792 = 317169352496467904123471454623995858135979545863947870440107106929057797924176955426728744597444115711561564160 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade061Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade061Part01856 = 246028507644366706399112075779151607362737510218186886679802292317409609318041105825881567858067092766151671808 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade061Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade061Part01920 = 191931777663372748310546049908178437529305997689344489321948249851372860933782925741713028432919158507784110080 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade061Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade061Part01984 = 149569014308343133000932837640560901951435259857806193081437006578849966970141980136350445284431936141955956736 := by decide +kernel

theorem group_length : firstCenterIntegerGrade061Group003.size = 512 := by
  simp only [firstCenterIntegerGrade061Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade061Group003 = 3531955181314145639585039316826587933084099693624804354128944015164237087446978988183987237727895772432217145344 := by
  simp only [firstCenterIntegerGrade061Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade061Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade061Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade061Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
