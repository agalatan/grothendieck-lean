import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade074Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade074Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade074Part04608 = 35657861232037524181527928603841950842372511576389646789045848082488933324843821052015835257186195727187968 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade074Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade074Part04672 = 30017652618044118726884602774370615185070641133394100597566692038393887588188199606114341648624768895680512 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade074Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade074Part04736 = 27325896833717078717053138218277966411543739139412465091393962546333105506805982696985934510139408331571200 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade074Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade074Part04800 = 14036946803241035430374164303461562762133773611278144010672963438414691368918138768378924169404073807708160 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade074Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade074Part04864 = 13676882851073483437936604733819470255076739253626836542719565006171635763400379868790726069538625459060736 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade074Part04928.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade074Part04928 = 29051878222901162235290295488579745645190449893348777030311632429446578336141001285856465355503987167592448 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade074Part04992.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade074Part04992 = 24774081806169801762614232078292326669254716354631015609712359377868978716572442592430475839779633505501184 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade074Part05056.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade074Part05056 = 18738525486270498135620012054311198011895782266558244806958610346398140230273519131563654999478351026978816 := by decide +kernel

theorem group_length : firstCenterIntegerGrade074Group009.size = 512 := by
  simp only [firstCenterIntegerGrade074Group009, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade074Group009 = 193279725853454702627300978254954835782538353228639230478381633265515950835143485002136357849655043921281024 := by
  simp only [firstCenterIntegerGrade074Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade074Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
