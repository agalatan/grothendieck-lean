import Grothe.UpperChaos.TaylorFirstIntegerGrade059Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade059Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade059Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade059Part01536 = 682381589589045831505833321564685733778498029804137300199013646221591996578731906707747463475189003286128623616 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade059Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade059Part01600 = 514504242741229866435630940602624679090676569759753196153114840843182721968014464621546986319485163177083142144 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade059Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade059Part01664 = 396553440411192248994080960956926468022451129336401822947286959631854408334584780271542994425873810981409259520 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade059Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade059Part01728 = 312293100357197678367257566691228317547858387509507113327874967600766917143864945058040480785672288990251712512 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade059Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade059Part01792 = 249552411078712769180741072227168189833847009069552357290563098730434680447153408540313275519235031563767906304 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade059Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade059Part01856 = 200174149854339041574095295481203122551187965320716675491534955727064456476170504475158838593367176293157699584 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade059Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade059Part01920 = 159241719340941513698247534418955783901923939676947257283178905012605831021375612994127384831111294967907090432 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade059Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade059Part01984 = 124188090094668500241436167438182526670614929724636516892223550148640617723065562104838789643018857542041206784 := by decide +kernel

theorem group_length : firstCenterIntegerGrade059Group003.size = 512 := by
  simp only [firstCenterIntegerGrade059Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade059Group003 = 2638888743467327449997322859380974821397057960201652239584790923916141629692961184773316213592952626801746640896 := by
  simp only [firstCenterIntegerGrade059Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade059Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade059Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade059Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
