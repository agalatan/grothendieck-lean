import Grothe.UpperChaos.TaylorFirstIntegerGrade050Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade050Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade050Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade050Part01024 = 1363232259750963658574769396921795877419597496723689984161880973771139994229048524384146557761749200493818675200 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade050Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade050Part01088 = 1928914188789205696768419703803607912837124393196672987157056665077142209546846796734049855964947063769925681152 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade050Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade050Part01152 = 831664577973716396859000276017535104964163505905184839747355246421245888859997797157924579793126765999794683904 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade050Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade050Part01216 = 755657240688691486593159698239391889134436617008189406640801738788879212220501649839615690804632259644021014528 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade050Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade050Part01280 = 717347512532935451573209716492968331415016151506630231409165566525717199439286628172636828768909590806401122304 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade050Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade050Part01344 = 1193918549791726037983572165270787998602939099357546606770330519112707368853497222487028289628731044599296950272 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade050Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade050Part01408 = 487578828308352174656976327781668275041911949653757443049261695566620921827944222462556213710704022671113322496 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade050Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade050Part01472 = 351630185824948900623817806484532570413021932414154777576387902505242649640724259761544272741137521371370225664 := by decide +kernel

theorem group_length : firstCenterIntegerGrade050Group002.size = 512 := by
  simp only [firstCenterIntegerGrade050Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade050Group002 = 7629943343660539803632925091012287959828211145765826276512240307768695444617847100999502289173937469355741675520 := by
  simp only [firstCenterIntegerGrade050Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade050Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade050Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade050Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
