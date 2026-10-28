import Grothe.UpperChaos.TaylorFirstIntegerGrade090Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade090Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade090Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade090Part00512 = 1594636377373702516710179895926934786251330472782033070355538169567777247380851761878349081969947568679415709696 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade090Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade090Part00576 = 120072446878897113714788024728563492051162281591534163305283156517435675021701791054915549844106792474482049024 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade090Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade090Part00640 = 1446469293406953946227965385825443179453646452728253502600491021705566427078952682223020724699306845791605227520 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade090Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade090Part00704 = 1446211833364633616243826324651819124209432111898465858865913787045870590748836868981749068735055235432017035264 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade090Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade090Part00768 = 1125803701976511262957308250902727718251812066438793970110002005591213813805687316347130879886325153952474071040 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade090Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade090Part00832 = 143833697957608062372639711977705108324421612307964833778045681804294112134854307315777737944086066518724444160 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade090Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade090Part00896 = 1112968437417898882881267948339137349608845627654121728363962402768506226033234012687323244986303174944057458688 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade090Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade090Part00960 = 962440570161637873118697595855234503689925469464635317133241370897422561554307318557900041023999891626616946688 := by decide +kernel

theorem group_length : firstCenterIntegerGrade090Group001.size = 512 := by
  simp only [firstCenterIntegerGrade090Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade090Group001 = 7952436358537843274226673138207565261840576094865802444512477595898086653758426059046166329089130729419392942080 := by
  simp only [firstCenterIntegerGrade090Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade090Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
