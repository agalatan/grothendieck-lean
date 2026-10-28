import Grothe.UpperChaos.TaylorFirstIntegerGrade085Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade085Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade085Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade085Part04608 = 57540740007722748870463028130040189661219167875162257088713715809474077395673181436104567310675666205147136 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade085Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade085Part04672 = 60247723297311358052100625171748909355968438761549235644688278029704218976037880388706854182535280600285184 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade085Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade085Part04736 = 50033859498545112100824759633011333131006824036414716392330790212632578787064931080492382237960104665153536 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade085Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade085Part04800 = 3693412613023301198182543765418394495883074995453817374956398069542813328918080862416972240812324683776000 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade085Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade085Part04864 = 43963524769860499636183139985475975162191099552674008240752012280363409846876739376139659679066709402058752 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade085Part04928.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade085Part04928 = 46508349830285119753678203961640089120057842162145690369642004115933229421251147453849524907200069884706816 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade085Part04992.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade085Part04992 = 43782756610309152010487145471175328765061128053570484467778726540430544085860505527465766344352141154451456 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade085Part05056.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade085Part05056 = 1801862277936445898006883078137196366338848469865409696188161886086403267892362129831762044861444071096320 := by decide +kernel

theorem group_length : firstCenterIntegerGrade085Group009.size = 512 := by
  simp only [firstCenterIntegerGrade085Group009, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade085Group009 = 307572228904993737519926329196647416057726423906835619275050086944167275109574828255007488947463740666675200 := by
  simp only [firstCenterIntegerGrade085Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade085Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
