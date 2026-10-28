import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade071Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade071Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade071Part04608 = 16966175774364304470508606000276256624188701158800061189908044779363131227032935881977455086037310799609856 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade071Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade071Part04672 = 11252967197114407915582904413023641309087796466444229736042729831422927521112791447589079717219591662862336 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade071Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade071Part04736 = 17915762425741729954796263936234126381308224392163998311486321964015250012333521041034207321177396225245184 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade071Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade071Part04800 = 22578193035850508046006262666652283692179151443440606185291951851900537835363884468677414278146889686712320 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade071Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade071Part04864 = 20259179665437347450493000555397043521893963256363476227607526022772135212138587339186331262723493738840064 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade071Part04928.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade071Part04928 = 35956172652978585199899534688817123126011678295761260234641588171192576040712265754828078925341583963324416 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade071Part04992.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade071Part04992 = 38010573843158592561955626771451048795969756179050145746649713772449005445240131193134636865174889996222464 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade071Part05056.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade071Part05056 = 23139563336731288906848984564245309349768025389656134620558152299976371929365862207021306658840926715117568 := by decide +kernel

theorem group_length : firstCenterIntegerGrade071Group009.size = 512 := by
  simp only [firstCenterIntegerGrade071Group009, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade071Group009 = 186078587931376764506091183596096832800407296581679912252186028693091935223299979333448510114662082787934208 := by
  simp only [firstCenterIntegerGrade071Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade071Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
