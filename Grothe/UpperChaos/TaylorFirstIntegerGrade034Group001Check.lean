import Grothe.UpperChaos.TaylorFirstIntegerGrade034Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade034Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade034Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade034Part00512 = 9093781261033978635106873459782191343709896302398345896663711433073500089443672927513612432375487090379481677824 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade034Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade034Part00576 = 4295313258682467789225442246010256846650368191369599222833090591413078870799661360927225296200812681244396486656 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade034Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade034Part00640 = 2492372056004661055253414297825402087787451119936905262648331041670926779734461469241568950324382508254610063360 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade034Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade034Part00704 = 1535104160627053108976696509530544494629296454709722931928016181101767639678588824601857683932605124706941534208 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade034Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade034Part00768 = 885702450494681630434734084447625005333220718315074334544395376370515554813080599067889368405329483122964692992 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade034Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade034Part00832 = 468685543445901985932436346229973933834776761655450926342876108644837820319788404287836061337231704121470353408 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade034Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade034Part00896 = 493342359038151843727858287291166010061945864391467565364262979586815203565890728409163162585659309956066705408 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade034Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade034Part00960 = 386130113963766273167947516051142390229131057703590773304909380787643863480314204988599513053290169679021604864 := by decide +kernel

theorem group_length : firstCenterIntegerGrade034Group001.size = 512 := by
  simp only [firstCenterIntegerGrade034Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade034Group001 = 19650431203290662321825402747168302112236086470480156913629593092649085821835458519037752468214798071464953118720 := by
  simp only [firstCenterIntegerGrade034Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade034Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade034Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade034Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
