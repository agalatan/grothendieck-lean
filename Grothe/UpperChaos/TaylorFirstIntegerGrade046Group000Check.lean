import Grothe.UpperChaos.TaylorFirstIntegerGrade046Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade046Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade046Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade046Part00000 = 395131142509254126211335794043786247440930028742588636199703640920070439087536272065037546886155459944061977231360 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade046Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade046Part00064 = 388975958492675713836937408738368265877765259474992125251285539089138327391175709344587152935638511188163627581440 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade046Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade046Part00128 = 709916510158809501235146323573144464308292150743602792989023328852323140028769169085754410892012904410676901969920 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade046Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade046Part00192 = 639192663133364420602823205787260163328426689423570169113045615405079132727747115274432342449277222954489641697280 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade046Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade046Part00256 = 498416449374756330027664098962909769872801733561635842635533474127929664260337082892441820960628373081578968973312 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade046Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade046Part00320 = 671381604717596624269399730801903762503923614210955726367398539444723359298595731077660121685175244077499905212416 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade046Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade046Part00384 = 241639406584396268620242842167697437666723854695626889370619977116443659955093935846093968326713868457001862823936 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade046Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade046Part00448 = 116150616636367095584766163380787122905706166032010588792463325690460132470207065829086014026630012499563691114496 := by decide +kernel

theorem group_length : firstCenterIntegerGrade046Group000.size = 512 := by
  simp only [firstCenterIntegerGrade046Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade046Group000 = 3660804351607220080388315567455857233904569496884982770719073440646167855219462081415093378162231596613036576604160 := by
  simp only [firstCenterIntegerGrade046Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade046Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade046Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade046Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
