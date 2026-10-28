import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group011Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade080Group011Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade080Part05632.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade080Part05632 = 18809071795811979983915639774095403515302496833780141522147681785130025275225815495573393486934940351201280 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade080Part05696.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade080Part05696 = 19644015120749916021590007218349116149034196892574604607206487725191827415578745343493688443144091432124416 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade080Part05760.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade080Part05760 = 11009194420854841505656194883586499750477693299905615591082493406327390819081367910042342868646658918318080 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade080Part05824.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade080Part05824 = 10499274870274687764272976033934714598869334628815585160945916579972877470836793194126604678432595239763968 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade080Part05888.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade080Part05888 = 16177146164258534741414274465500557373188473450189203925241590895904045376619441979276231945174266494844928 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade080Part05952.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade080Part05952 = 14158733756370817064813776403857813480345985373930607448668716089414090972241029485983804993595423103909888 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade080Part06016.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade080Part06016 = 12582158963829790314755455023673479501782210665131429541176358243222688850613402786815300481172866468937728 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade080Part06080.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade080Part06080 = 12837713834958591964447633902965494571316015610807426709851378241158710111242086082843484774006748398747648 := by decide +kernel

theorem group_length : firstCenterIntegerGrade080Group011.size = 512 := by
  simp only [firstCenterIntegerGrade080Group011, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade080Group011 = 115717308927109159360865957705963078940316406755134614506320622966321656291438682278154851671107590407847936 := by
  simp only [firstCenterIntegerGrade080Group011, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade080Group011Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group011Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group011Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
