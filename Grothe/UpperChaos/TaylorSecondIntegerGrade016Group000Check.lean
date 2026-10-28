import Grothe.UpperChaos.TaylorSecondIntegerGrade016Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade016Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade016Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade016Part00000 = 35552126572132566412470942003444299660450211314308177587798017624680150662147343271840470427806431068644953817088 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade016Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade016Part00064 = 2670421818516019941214157787295629587136605160423342313022828185914153151251476256536932743416432771191042736128 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade016Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade016Part00128 = 1148706596797988559917873314810245315878509444331844258063234564247575263423392302707482610477046236178838192128 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade016Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade016Part00192 = 435799709540371010026760362763491305895726936192051099348912802188168773131057478003292295062953086821295194112 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade016Part00256.size = 50 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade016Part00256 = 148602798457823864562198291980516983732844732057739291926656376274659105870916317242186303548236872495721873408 := by decide +kernel

theorem group_length : secondCenterIntegerGrade016Group000.size = 306 := by
  simp only [secondCenterIntegerGrade016Group000, Array.size_append, len0, len1, len2, len3, len4]

theorem group_energy : energy secondCenterIntegerGrade016Group000 = 39955657495444769788191931760294182853093897587313154550159649553304706955824185626330364380311100035331851812864 := by
  simp only [secondCenterIntegerGrade016Group000, energy_append, sum0, sum1, sum2, sum3, sum4]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade016Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade016Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade016Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
