import Grothe.UpperChaos.TaylorFirstIntegerGrade085Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade085Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade085Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade085Part00512 = 2358863069308558485003256459707686964398890397593608042523316378811837597960069788693670454637285226533040947200 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade085Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade085Part00576 = 2171159898325357249712045977791615964549530497090646110968712559430847701243219258072334423924680995863252697088 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade085Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade085Part00640 = 1956522765429525692504296395878059421111583391504801252795137078845211587683931280330417003541817313908276330496 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade085Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade085Part00704 = 26930511247692748786763802186758378041376214104816865261246862834405713114933111742771018814380080279098228736 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade085Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade085Part00768 = 1821808622926708483001269256715782667998046045028727324349223645445277149172521832397994644268916052751737159680 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade085Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade085Part00832 = 1585802732937116108640598478946294781408419391024666622028761696406668389686899969368510688464569881806472478720 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade085Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade085Part00896 = 1052133785700959832082454974467482315675769819136970801551713615413926195445426375384493065254149848520980430848 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade085Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade085Part00960 = 220002838093881420321020961836916796005972687540457886206948101321680350463073393391644296845646897672475377664 := by decide +kernel

theorem group_length : firstCenterIntegerGrade085Group001.size = 512 := by
  simp only [firstCenterIntegerGrade085Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade085Group001 = 11193224223969800020051706307530597289189588443024694905685059938509854684770075009381835595751446297335333650432 := by
  simp only [firstCenterIntegerGrade085Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade085Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
