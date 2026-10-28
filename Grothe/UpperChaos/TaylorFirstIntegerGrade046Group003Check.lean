import Grothe.UpperChaos.TaylorFirstIntegerGrade046Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade046Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade046Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade046Part01536 = 151345105651389148513857199138615385637735254743150737059207143986384984787112418914872904533632209621612494848 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade046Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade046Part01600 = 66203630196636687658570752000036313930396349018898396078683251676161833892083647197652762030655931663469510656 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade046Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade046Part01664 = 42558473747454746234769558680677794410102545050994412972650226414275715597746709853055881347505135240135835648 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade046Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade046Part01728 = 32538916713583661635872673177171926292160063618720698957568600625246548145587045683529041152701869880537776128 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade046Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade046Part01792 = 21533341308334241818425370785498521935137680899589922763817147742075723148700502112780193339322651476515356672 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade046Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade046Part01856 = 30495397574891603833753312830518928666597387660546434692965039733921792045473781577372530135234488548664016896 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade046Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade046Part01920 = 10900118491464750820616202144355832607475400666103402254319703771123617593671152833170529106485169280396558336 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade046Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade046Part01984 = 4706279279792945897947888416982165306542565728192546766639270371268150489311122631904834899343817161561866240 := by decide +kernel

theorem group_length : firstCenterIntegerGrade046Group003.size = 512 := by
  simp only [firstCenterIntegerGrade046Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade046Group003 = 360281262963547786413812957173856868786147247386196551545850384320458365699686380804338676544881272872893415424 := by
  simp only [firstCenterIntegerGrade046Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade046Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade046Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade046Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
