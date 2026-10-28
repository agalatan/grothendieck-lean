import Grothe.UpperChaos.TaylorSecondIntegerGrade042Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade042Group003Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade042Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade042Part01536 = 435425612058460346907475046399839373945921799225979231618008666283046891219465693806318716177418261872246784 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade042Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade042Part01600 = 539824252274923091150812288333953706646966120763242126475188350833057427562296481641810967438204734017634304 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade042Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade042Part01664 = 347827018775572295651559060058558245123818995311044421055408138954472427849287987049734126363903685270962176 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade042Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade042Part01728 = 339190841888243306822961207953461883484383773421505404207298417663944252448509413597575219806593435599634432 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade042Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade042Part01792 = 261205923797626413942882358582158106884403410379585304665558066623437262822924950554565420732051331422879744 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade042Part01856.size = 36 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade042Part01856 = 189948378417169766459781210776934348756204053537173885215106604244955449025848647580779165195794758137544704 := by decide +kernel

theorem group_length : secondCenterIntegerGrade042Group003.size = 356 := by
  simp only [secondCenterIntegerGrade042Group003, Array.size_append, len0, len1, len2, len3, len4, len5]

theorem group_energy : energy secondCenterIntegerGrade042Group003 = 2113422027211995220935471172104905664841698152638530373236568244602913710928333174230783615713966206320902144 := by
  simp only [secondCenterIntegerGrade042Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade042Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade042Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade042Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
