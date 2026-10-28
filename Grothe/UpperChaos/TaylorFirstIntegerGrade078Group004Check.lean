import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade078Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade078Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade078Part02048 = 157609389070938285701487943009953584255243347432163496617617982130202809699210626815245932866676004346373603328 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade078Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade078Part02112 = 128778758730461528649529611623007060019586393374639422368099514296519938841579788322138564839612673547143479296 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade078Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade078Part02176 = 27419376428153603546752057831225889342283724347351449922434363311486822535490622420528626958648129209495453696 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade078Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade078Part02240 = 77420233202586525710108307789571571827418014006140624597799733637923572046131195959171709430040176064179732480 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade078Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade078Part02304 = 85040189384382861129045671063008985852317618349655452498964712714598874306543208052532585302358812473239273472 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade078Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade078Part02368 = 68839223307652030501738613274424296954197924098272457397818376044766797901431764806748145576891664220643393536 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade078Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade078Part02432 = 55751323936133128984223007251610783797912615629178103648092531635264576215108500337956490756963335987032752128 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade078Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade078Part02496 = 10292857888529099587146347076317848336451773627184014998995022162366625165710402851418038669057657599116181504 := by decide +kernel

theorem group_length : firstCenterIntegerGrade078Group004.size = 512 := by
  simp only [firstCenterIntegerGrade078Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade078Group004 = 611151351948837063810031558919120020385411410864585022049822235933130016711206109565740094400248453447223869440 := by
  simp only [firstCenterIntegerGrade078Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade078Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
