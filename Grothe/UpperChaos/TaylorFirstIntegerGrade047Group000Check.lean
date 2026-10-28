import Grothe.UpperChaos.TaylorFirstIntegerGrade047Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade047Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade047Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade047Part00000 = 326114755832141995960390794624704527874704061800533833748466122397311110036665981749936891110447762389586782715904 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade047Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade047Part00064 = 295125946783646626796274423330236745910561809591032237874163527909513702445271002109790152167608936949870577582080 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade047Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade047Part00128 = 284041887154210830134108015384405648702210725808501848877301482922470463003308258572948317023814509463060355219456 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade047Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade047Part00192 = 661746551459497834753949495023106864340858620555419838077272774134493931156116280253091841687806517590017473249280 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade047Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade047Part00256 = 397195099834374329322566347829634364186274807114317184578719604844402428381270176968981900744987054203146896146432 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade047Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade047Part00320 = 360789907066866834977944576721424201794997376932748731769431862381939942283818126021584385784326193198673141170176 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade047Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade047Part00384 = 458499297650496953923498545082858979854315705486373158171695846383984647273715464695929063625086790644298718117888 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade047Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade047Part00448 = 117575833323974270047967615430499924821646574786844884296555921355331767009113218973882596532770866774653542596608 := by decide +kernel

theorem group_length : firstCenterIntegerGrade047Group000.size = 512 := by
  simp only [firstCenterIntegerGrade047Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade047Group000 = 2901089279105209675916699813426871257485569682075771717393607142329447991589278509346145148676848631213307486797824 := by
  simp only [firstCenterIntegerGrade047Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade047Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade047Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade047Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
