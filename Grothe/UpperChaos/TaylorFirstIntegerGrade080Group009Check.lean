import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade080Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade080Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade080Part04608 = 18403238672442064733348779287100071366850550748161810247542594386052129068434544429327283305080573462052864 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade080Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade080Part04672 = 44323277274807746867608519958879779036335679982590156998162488262936098265717582818255227602486496115818496 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade080Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade080Part04736 = 51643345070865138180272095342532779527143604863282329500591998408923469333792036722571947899222165288910848 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade080Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade080Part04800 = 43662244053857849348642394295819462797299957599012439787396706419332143015013996815817940440327969004584960 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade080Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade080Part04864 = 33787929196641731440777323326859516904217271720306899034041978428894271381854109191045866864650438850904064 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade080Part04928.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade080Part04928 = 4004230461718812518717068682219952859853514521988336018057441589486793206766804869602591454275870830624768 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade080Part04992.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade080Part04992 = 26619827228226632689235918319310193144084147518908073256687977536473760687082940472608161122193605306351616 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade080Part05056.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade080Part05056 = 25757019347601830996890986298496657928233134148265500141982252559562371367875493775405997309828563914981376 := by decide +kernel

theorem group_length : firstCenterIntegerGrade080Group009.size = 512 := by
  simp only [firstCenterIntegerGrade080Group009, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade080Group009 = 248201111306161806775493085511218413564017861102515544984463437591661036326537509094635015998065682774228992 := by
  simp only [firstCenterIntegerGrade080Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade080Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
