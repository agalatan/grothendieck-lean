import Grothe.UpperChaos.TaylorSecondIntegerGrade034Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade034Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade034Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade034Part00000 = 1904300836284449058731113302075998799416247560694251606057769366731299481107451029842452329916036822263748624384 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade034Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade034Part00064 = 1123699752278917983418876804898749195670481706607551821955948687760132527405472527460210749865752612626952617984 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade034Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade034Part00128 = 613750553601224101366811678955990057952310131082851527766787565901203626169655007774671172434622839185534353408 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade034Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade034Part00192 = 328948692834424971445290721415755962952115592811611090837097315652681723103049544541748199038356549469137272832 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade034Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade034Part00256 = 304475923365040363648024135895403981569974022678313269580060843945204580899100164933220360985483104685947617280 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade034Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade034Part00320 = 129927104746063955523271946757398445312756863462956681300195810759764600792761868718461492795314126721273298944 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade034Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade034Part00384 = 133955710706912175673060967260766733788667768536106767668176266410734157004012092877122594872514315954631475200 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade034Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade034Part00448 = 164368397419392500168527873902302341563470308248476076270515571627597639589104219042819682725062211566070398976 := by decide +kernel

theorem group_length : secondCenterIntegerGrade034Group000.size = 512 := by
  simp only [secondCenterIntegerGrade034Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade034Group000 = 4703426971236425109974977431162365518226023954122118841436551428788618336070606455190706582633142582473295659008 := by
  simp only [secondCenterIntegerGrade034Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade034Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade034Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade034Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
