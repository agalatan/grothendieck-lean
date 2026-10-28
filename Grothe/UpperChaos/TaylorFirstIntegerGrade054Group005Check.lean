import Grothe.UpperChaos.TaylorFirstIntegerGrade054Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade054Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade054Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade054Part02560 = 5173478159632977255154715752935203363663072108691388870312878821837915658762528946028575804019795333887295488 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade054Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade054Part02624 = 6367833041801277181499207134937892529949462631585349277468712445018708238574787085827995491260024667854864384 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade054Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade054Part02688 = 3490352772560704158448494529032123292579034651132275495123893611886722853839358849719196804278464753325572096 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade054Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade054Part02752 = 1607781490478876121924045425021102807530207568992270464348130472028326925599763409276945259060215784503508992 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade054Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade054Part02816 = 1467083632053127659952725219661374599750099023162402143846899464474183713168354227438262480938020327533838336 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade054Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade054Part02880 = 999956959777353406763205684911665128345463938209398152099431381096560291715750543843100983971597496667340800 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade054Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade054Part02944 = 712907975953579490985816288780145098429694221420289092927493804429252646044255510562848079921801611454709760 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade054Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade054Part03008 = 873109731690389171969193816613904865215859296318093358257949003567193717571151285427942083012044823310893056 := by decide +kernel

theorem group_length : firstCenterIntegerGrade054Group005.size = 512 := by
  simp only [firstCenterIntegerGrade054Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade054Group005 = 20692503763948284446697403851893411685462893439511466854385389004338864045275949858124866986461964798538022912 := by
  simp only [firstCenterIntegerGrade054Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade054Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade054Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade054Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
