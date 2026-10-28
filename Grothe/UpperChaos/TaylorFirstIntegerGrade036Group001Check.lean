import Grothe.UpperChaos.TaylorFirstIntegerGrade036Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade036Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade036Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade036Part00512 = 15940388255409337835121690849910341729874664224665557151933755298558715622720219987404489530211352292926020386816 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade036Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade036Part00576 = 5114598870211734790285616434598034572570170762800027093443063786090638819372674066354311134880541657353099935744 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade036Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade036Part00640 = 3704568880384435206701643705634280691019415102484860302031740136410252098760725823289158518788329058881842970624 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade036Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade036Part00704 = 2013063948424096850056966722771648850701325828790559302812626589509213517793682681253000687481391809218455011328 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade036Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade036Part00768 = 549358847421092038045617087342379466921690851689692625989126584969963556606834757633441531433474741211521613824 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade036Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade036Part00832 = 616067931002824762199811783223695829266168668388730899079027537231615803965130595080192089669450118212618289152 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade036Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade036Part00896 = 569316349836118427429772275298143056677534160088695275870125608024491140393365488887918798019522828067313549312 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade036Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade036Part00960 = 346295624813491146399601896438962741459411706829037623522685232576226444578078912015649767418138838786063204352 := by decide +kernel

theorem group_length : firstCenterIntegerGrade036Group001.size = 512 := by
  simp only [firstCenterIntegerGrade036Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade036Group001 = 28853658707503131056240720755217486938490381305737160274682150773371117004190712311918162057902201344656934961152 := by
  simp only [firstCenterIntegerGrade036Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade036Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade036Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade036Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
