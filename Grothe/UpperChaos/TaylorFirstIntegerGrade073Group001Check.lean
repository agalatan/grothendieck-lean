import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade073Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade073Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade073Part00512 = 8295043597848535361450419283105551926802582211494842391152949084782362577901609614075850375993359057627662778368 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade073Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade073Part00576 = 6815139996282757762135731597543953043744112393582539766733109252122813790021404895985030868467679573088183255040 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade073Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade073Part00640 = 5464208753214845291395417117517233755280469022764274914379721814527194169763015010850240076454290347731898597376 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade073Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade073Part00704 = 4117335863814130894343790947298787741618843223124964477861978120432430134033172364185867390049236548402834046976 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade073Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade073Part00768 = 2884216031282281984109675893538094330188837370132143831929197913461257806879103302826120659494532685626880294912 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade073Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade073Part00832 = 1016785611344189090328399576059796866268497297748565758118613258875571767496652359802268257841301120086219685888 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade073Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade073Part00896 = 1122998841980142684698192332935301331686108160113018959483219398087052002147145386979940210832086636338547261440 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade073Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade073Part00960 = 1597343546288272940171282694214695797778281910260026282574099877254007133522069571451398344688668081128715845632 := by decide +kernel

theorem group_length : firstCenterIntegerGrade073Group001.size = 512 := by
  simp only [firstCenterIntegerGrade073Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade073Group001 = 31313072242055156008632909442213414793367731589220376382232888719542689381764172506156716183821154050030941765632 := by
  simp only [firstCenterIntegerGrade073Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade073Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
