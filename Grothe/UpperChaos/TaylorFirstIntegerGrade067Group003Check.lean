import Grothe.UpperChaos.TaylorFirstIntegerGrade067Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade067Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade067Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade067Part01536 = 935391198513656886411103821914903953117531457894722964172091831149088463593454356221982530586816706186426974208 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade067Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade067Part01600 = 746474802652503323193165183397126546248936376242492459307261645513734037374463725419378920521730297116013625344 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade067Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade067Part01664 = 561678712731751459468499221205125588911848556884597382490065405620632557267350099669324897429303855822093156352 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade067Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade067Part01728 = 72374234071106545853844209697100856743406226547988443961325273891410148433444723840006805257978595079046037504 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade067Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade067Part01792 = 421393227772535235813342965620908581010139925159617429318722171479888084865786413963855462223460208265773711360 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade067Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade067Part01856 = 361707987420628113807948471623571894083519143969775309071096211847991069571179153399075590707260673417677897728 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade067Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade067Part01920 = 282947959020515838518827538548467710967462415277898463863715640358169763367732902154125386899185626909501292544 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade067Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade067Part01984 = 221281083870431308251123109390770279661052730045391987688226001176525692638531014560881595306382329799992410112 := by decide +kernel

theorem group_length : firstCenterIntegerGrade067Group003.size = 512 := by
  simp only [firstCenterIntegerGrade067Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade067Group003 = 3603249206053128711317854521397975410743896832022484439872504181037439817111942389228631188932118292596525105152 := by
  simp only [firstCenterIntegerGrade067Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade067Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade067Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade067Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
