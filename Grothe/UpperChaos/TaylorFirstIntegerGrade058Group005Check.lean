import Grothe.UpperChaos.TaylorFirstIntegerGrade058Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade058Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade058Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade058Part02560 = 7562532434899125005487686072030518546614074359159656348286594207071571210439134167551940115656806645305966592 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade058Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade058Part02624 = 5866635675502621210292968796445382603697575007947333381998942143848869199811817574728443284407777817748570112 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade058Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade058Part02688 = 4300081803709858715976593026208293668741079951916196013322061931092501092025183530313014038170322267059257344 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade058Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade058Part02752 = 3323605450729553258497282530854396846893128909189445228004424807521177980724058381586368175434844815270871040 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade058Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade058Part02816 = 3817719381936491712400106907159488627976554502177031821738951788174370991667258986985094688377898357693087744 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade058Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade058Part02880 = 2946960745991292945457573162329079334943163546222584001219613238944174534572917702291411009213996922684047360 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade058Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade058Part02944 = 1717165289754808567721118297444272628381690698618405566269391863829009817827330090737011574842360406124527616 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade058Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade058Part03008 = 1013042316735101773892042015540415214591225572231578791754961374788202345079384136122758096574497162289741824 := by decide +kernel

theorem group_length : firstCenterIntegerGrade058Group005.size = 512 := by
  simp only [firstCenterIntegerGrade058Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade058Group005 = 30547743099258853189725370808011847471838492547462231152594941355269877172147084570316040982678504394176069632 := by
  simp only [firstCenterIntegerGrade058Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade058Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade058Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade058Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
