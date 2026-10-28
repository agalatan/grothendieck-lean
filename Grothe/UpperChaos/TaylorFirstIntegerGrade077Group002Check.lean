import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade077Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade077Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade077Part01024 = 667429502754597914866075957986995003657316749161502782427482811497598432315938922457717381255595645354821812224 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade077Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade077Part01088 = 934126295879539988386144132707592887555805995125834929143810957718127403832604532824777262544922101634358575104 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade077Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade077Part01152 = 829210869487228635975142714863543553472369441544818353867901126886493011955995436081624327518706584908675940352 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade077Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade077Part01216 = 773538021056020681088068878233673934485367044232304274187603544298546620880434712436566100632891922306473918464 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade077Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade077Part01280 = 175304399828296029183520804632165248436023498774317989560986610476881046521104162473277450564582204452961779712 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade077Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade077Part01344 = 553833384171747455068929094186224874792320702201046174969049281855805836568448662760310287076901228460388646912 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade077Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade077Part01408 = 664831442615945772865223733992069053927185378882211883436747725454343998880264332522388360186583540246694068224 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade077Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade077Part01472 = 597533669852733525153575860454920596738698155477169898748744268363511689973699871709868350626566964442755497984 := by decide +kernel

theorem group_length : firstCenterIntegerGrade077Group002.size = 512 := by
  simp only [firstCenterIntegerGrade077Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade077Group002 = 5195807585646110002586681177057185153065086965399206286342326326551308040928490633266529520406750191807130238976 := by
  simp only [firstCenterIntegerGrade077Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade077Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
