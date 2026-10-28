import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group011Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade076Group011Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade076Part05632.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade076Part05632 = 26135714695402676238417758740256407504630100089353833652337055297461512914653642313846543281014321421746176 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade076Part05696.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade076Part05696 = 1732221101687883854132081795935070059198946920663215718571218343509581663227261043173326925288590400290816 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade076Part05760.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade076Part05760 = 27810523839240788819655806898408487895194264662256387482385648872736507194088206362453588921769415155908608 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade076Part05824.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade076Part05824 = 18413229354958041293608846432518210938242604996154751574587953908328159800853382853013223321352141681983488 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade076Part05888.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade076Part05888 = 8449150981271499134461919442974672038990946663527113919035292784593438507964768413901204205483958579757056 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade076Part05952.size = 54 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade076Part05952 = 3411304339892509349585867546945516610636027314878807982391049184211939133568818973411349838764086543777792 := by decide +kernel

theorem group_length : firstCenterIntegerGrade076Group011.size = 374 := by
  simp only [firstCenterIntegerGrade076Group011, Array.size_append, len0, len1, len2, len3, len4, len5]

theorem group_energy : energy firstCenterIntegerGrade076Group011 = 85952144312453398689862280857038365046892890646834110329308218390841139214356079959799236493672513783463936 := by
  simp only [firstCenterIntegerGrade076Group011, energy_append, sum0, sum1, sum2, sum3, sum4, sum5]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade076Group011Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group011Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group011Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
