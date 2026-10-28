import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade081Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade081Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade081Part02048 = 154455498831598851278773762670527518600185366059042229148098146049779852476583048188021616203703124216906776576 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade081Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade081Part02112 = 126455964788599107613214429685973313204218138830745664605716327390728867733857318634036757302814135508730380288 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade081Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade081Part02176 = 21278336531141673116601822673134395211139916550056357916120015326398066879703855703824548838562925181931618304 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade081Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade081Part02240 = 82309130843536153140809316416160366494001093918719519839246348023543309210912464671055606642697464805270224896 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade081Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade081Part02304 = 85030626673071821871479642808285567104709522514519367119968821383283568653605206798774462712356699152276520960 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade081Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade081Part02368 = 69912262241644987864502979089691506890809578987353579283889959544565726322612209982095855038212538224823238656 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade081Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade081Part02432 = 57409622960978168757825181127761481781036337604619837894164551928668076141565748716525038177087157638916997120 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade081Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade081Part02496 = 63213754509368528412260973163613844363894030760049955112603514503014784674521052272091458867394097205739520 := by decide +kernel

theorem group_length : firstCenterIntegerGrade081Group004.size = 512 := by
  simp only [firstCenterIntegerGrade081Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade081Group004 = 596914656625080132171619395444697763130463848495816605762316773161470482203514373746605976374301438826061496320 := by
  simp only [firstCenterIntegerGrade081Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade081Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
