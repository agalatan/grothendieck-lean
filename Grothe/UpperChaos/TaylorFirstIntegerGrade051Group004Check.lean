import Grothe.UpperChaos.TaylorFirstIntegerGrade051Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade051Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade051Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade051Part02048 = 16493916856072258660446090629103132625193863072719893408348557154698325502400608375997063007210645403042054144 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade051Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade051Part02112 = 12075600066463702973419126518884457089576544100031384198821831624957829296667460820747480412213455237188419584 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade051Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade051Part02176 = 8055434061747959799780591699150520803020107270924930221701172694049436253185390958388098448713290439494467584 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade051Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade051Part02240 = 9713023214355013961762551210143257765157600163914401315302322129931062084840191965123213790240543863541334016 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade051Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade051Part02304 = 9175776010740968719154273446429799317132480331545609938143956141865175305183180346412513827026435504200482816 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade051Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade051Part02368 = 7210150881992791820738378613360920674560984573340443676410982757327253001645845825650160955034646202887962624 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade051Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade051Part02432 = 8755258686795264168188586711508563827513102011957229544624201863715811178976319749249742639148173570464546816 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade051Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade051Part02496 = 3184403552568081118395215777055793282947069571866806657656785415384311257124440690547114706211412450413117440 := by decide +kernel

theorem group_length : firstCenterIntegerGrade051Group004.size = 512 := by
  simp only [firstCenterIntegerGrade051Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade051Group004 = 74663563330736041221884814605636445385101751096300698961009809781929203880023438732115387785798602671232385024 := by
  simp only [firstCenterIntegerGrade051Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade051Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade051Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade051Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
