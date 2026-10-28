import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade082Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade082Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade082Part03072 = 12932484967628273244795144666936012424153609592565104057347307760425402184996986369530068066757002466330411008 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade082Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade082Part03136 = 10272857755162053229545705086620442742619384000762814412749831463267416319706714182142366094020846935926112256 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade082Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade082Part03200 = 6068485316690219828415999513604826199184642307815268471441073952056502885052094442975803994111012442734592 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade082Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade082Part03264 = 8021933215292376442375644359853500475684610398889377973831305748443041943408131256713962593528645527841800192 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade082Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade082Part03328 = 6124424284307228769883266186289014013903053161637564319104646831440440646657405942769788238773338589454401536 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade082Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade082Part03392 = 4560655515738888182904718206418781230619440008673743380917996079693531954991774928385156163124194017911242752 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade082Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade082Part03456 = 8058397511041520599577331954037513522743135075528791139135665950292860076640915657777468088873653194719232 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade082Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade082Part03520 = 3319945844957072819953342905685220787843761653040922857142378064806402749392224365709333892886175123893125120 := by decide +kernel

theorem group_length : firstCenterIntegerGrade082Group006.size = 512 := by
  simp only [firstCenterIntegerGrade082Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade082Group006 = 45246428465913624429885814743270614014545786592952871060704042687978585162114930055351428321173187326994546688 := by
  simp only [firstCenterIntegerGrade082Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade082Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
