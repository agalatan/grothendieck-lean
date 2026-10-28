import Grothe.UpperChaos.TaylorSecondIntegerGrade043Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade043Group003Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade043Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade043Part01536 = 430378787929618151467814281109527532282702940469187896481557547653470767744874574813562174100578421033664512 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade043Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade043Part01600 = 624842327324073632025854283951725427027733935036125536114505388264456966906709273491564157444529963059380224 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade043Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade043Part01664 = 259942781298470239961338876532580039063042633322151822934601671463135321834907491432331226660041958224822272 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade043Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade043Part01728 = 335894393536460889662286657029220178622048042104554273500908166384082104024165523964366738308282752429981696 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade043Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade043Part01792 = 305386127206017708799526656846473844398792056907819043454476775889932645412764135244036790215735912383381504 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade043Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade043Part01856 = 157855038671308213091176992449679769992695027489205971476394849412698159618114796702930301068759660721340416 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade043Part01920.size = 60 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade043Part01920 = 278074523682149894092217671628051314755441430653646258222644508789939869699427883458773044822215452375646208 := by decide +kernel

theorem group_length : secondCenterIntegerGrade043Group003.size = 444 := by
  simp only [secondCenterIntegerGrade043Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6]

theorem group_energy : energy secondCenterIntegerGrade043Group003 = 2392373979648098729100215419547258106142456065982690802185088907857715835240963679107564432620144120228216832 := by
  simp only [secondCenterIntegerGrade043Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade043Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade043Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade043Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
