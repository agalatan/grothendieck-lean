import Grothe.UpperChaos.TaylorFirstIntegerGrade062Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade062Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade062Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade062Part00000 = 33530365686139351538766477513143129215394804389464678690818998507425140439364918123003412067437951596232947269632 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade062Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade062Part00064 = 63052879888525605790111830371961983087315015005098102063242027307205531867909007387935057389997321294446860435456 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade062Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade062Part00128 = 79678293507709896311024575816086476914863741216906500926887064816529776267826880435075200941636125895525855657984 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade062Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade062Part00192 = 87369170479589776952499491355485851198540698144717596058533245098259923216381009892235776063336151633547711479808 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade062Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade062Part00256 = 86025320402254852860495097117819359305996960021611064496749321788472189219949288877588752161248867156275476037632 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade062Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade062Part00320 = 75309921927566010247334990336164468582515606038686802591308975388884189520080757138275579276686064775015589478400 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade062Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade062Part00384 = 59190347241414344331441905268046475569555566008035757483784394273483386601416526338799655848445053996848774119424 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade062Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade062Part00448 = 43026665516917155632547755605715368965593394119985327038623461918195617711756940139106532014369259339085307183104 := by decide +kernel

theorem group_length : firstCenterIntegerGrade062Group000.size = 512 := by
  simp only [firstCenterIntegerGrade062Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade062Group000 = 527182964650116993664222123384423112839775784944505829349947489098455754844685328332019965763156795686978521661440 := by
  simp only [firstCenterIntegerGrade062Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade062Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade062Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade062Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
