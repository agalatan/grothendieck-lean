import Grothe.UpperChaos.TaylorFirstIntegerGrade087Group011Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade087Group011Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade087Part05632.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade087Part05632 = 9318805248986583288498971187689026742624951741302477654846498285716971826015801206519059424587388163194880 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade087Part05696.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade087Part05696 = 8206019605476110598840415485135674209057235808890700829538715169560617351090388967848836890546507918344192 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade087Part05760.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade087Part05760 = 14502042679279714347556958569133424989822254696873669992406069428960340368885658372035364497865698516664320 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade087Part05824.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade087Part05824 = 12145140272217175528153276683849586714987546388721356681394833794810971451278870887300728704084598763552768 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade087Part05888.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade087Part05888 = 1684517148837871495045546890665362706938623741716551018865021942993377974596571386791488070828919036575744 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade087Part05952.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade087Part05952 = 11031838137474335052042832845467868871874551664142369762232457610754216680950686947141813507432175466708992 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade087Part06016.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade087Part06016 = 12088489181967175492944832912295171656470891673961598387506819855105876554637308660647181035431992185847808 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade087Part06080.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade087Part06080 = 7966193313226133660470904231825350967257615647058590443557935578273592398302669597667544185644820354564096 := by decide +kernel

theorem group_length : firstCenterIntegerGrade087Group011.size = 512 := by
  simp only [firstCenterIntegerGrade087Group011, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade087Group011 = 76943045587465099463553738806061466859033671362667314770348351666175964605757956025952016316422100405452800 := by
  simp only [firstCenterIntegerGrade087Group011, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade087Group011Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group011Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group011Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
