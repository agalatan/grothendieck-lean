import Grothe.UpperChaos.TaylorFirstIntegerGrade067Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade067Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade067Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade067Part02048 = 173602986225325478450283499828540250646800372719954211072199596921462045283819746629640116835156005131200233472 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade067Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade067Part02112 = 136454868005514801729267363572834213910347484993098798535829595044874128848403881762433826319789591829873164288 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade067Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade067Part02176 = 107013394135385253207193900208639430342721940278632681487085964675344103979434136768221568072776690070284402688 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade067Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade067Part02240 = 83233741743361757003598325143616196531932462879054154425602887800530278727884108421200888752053235388403154944 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade067Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade067Part02304 = 63825190268586369711040737201785992593790501892338164903873763694073959032304052169980750602961517419490705408 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade067Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade067Part02368 = 48077800709470833414354706421815454487400845161611141343821574505482537277671453044991278875890700281035358208 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade067Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade067Part02432 = 35575139220158708834228129334150786269416701838248878231639677760441592665206954756280022768116043234488090624 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade067Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade067Part02496 = 25903077140885220798427414188339501348200509422679237856031440552441430497880257968742157910492709170486181888 := by decide +kernel

theorem group_length : firstCenterIntegerGrade067Group004.size = 512 := by
  simp only [firstCenterIntegerGrade067Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade067Group004 = 673686197448688423148394075899721826130610819185617267856084500954650076312604591521490610137236492525261291520 := by
  simp only [firstCenterIntegerGrade067Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade067Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade067Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade067Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
