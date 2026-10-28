import Grothe.UpperChaos.TaylorFirstIntegerGrade057Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade057Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade057Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade057Part01024 = 6944879556541774765628248501194434472782460821146228655738612098389576063042199165420071971567937982234175209472 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade057Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade057Part01088 = 5271756825555331968039883838905786894252086024835438385381331373351384653575242433505623841182431726212432789504 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade057Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade057Part01152 = 3882660254386775041886658419525987696157550048387042048221135177184734806222313552912876594294592103769578668032 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade057Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade057Part01216 = 2796627502972432530204113483423948706446234405794505294795584279558959292425218456157930588897766647762390089728 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade057Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade057Part01280 = 1985862752887667245564078305319196213723910897546828715280462149658680715585716104178355393154723603003117404160 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade057Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade057Part01344 = 1405244464104763790802235255460113997474476800281497534857312493340654809501575497985640309966146962688000917504 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade057Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade057Part01408 = 1003840405344884693183331408695424883468190109516234609859119488063589343069411180479359431843591467437213614080 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade057Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade057Part01472 = 1169755095121631570118615951723155872896787833516649866919397001061975416770160695058472756102435403120133537792 := by decide +kernel

theorem group_length : firstCenterIntegerGrade057Group002.size = 512 := by
  simp only [firstCenterIntegerGrade057Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade057Group002 = 24460626856915261605427165164248048737201696941024425111052954060609555100191837085698330887009625896227042230272 := by
  simp only [firstCenterIntegerGrade057Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade057Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade057Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade057Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
