import Grothe.UpperChaos.TaylorFirstIntegerGrade034Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade034Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade034Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade034Part01024 = 230354039853568388526868580825775675944372167675446027377480231438214503744680602137788314193168271894500081664 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade034Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade034Part01088 = 109618581718969997956339581571500721719649642819509814982599325079498033932841417581936603443887899407344992256 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade034Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade034Part01152 = 89907063802641310544819824877859829603919688475824035746310757727434218907286589323695396869871908642134949888 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade034Part01216.size = 44 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade034Part01216 = 96235756677924668798416504472886057888824350872532241922737333722406456131488353096316615922542277147649638400 := by decide +kernel

theorem group_length : firstCenterIntegerGrade034Group002.size = 236 := by
  simp only [firstCenterIntegerGrade034Group002, Array.size_append, len0, len1, len2, len3]

theorem group_energy : energy firstCenterIntegerGrade034Group002 = 526115442053104365826444491748022285156765849843312120029127647967553212716296962139736930429470357091629662208 := by
  simp only [firstCenterIntegerGrade034Group002, energy_append, sum0, sum1, sum2, sum3]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade034Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade034Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade034Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
