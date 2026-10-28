import Grothe.UpperChaos.TaylorFirstIntegerGrade064Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade064Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade064Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade064Part01024 = 4329104993832381437104266656789608741916203350072624760627014295078391999075752148828332026700117130430432411648 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade064Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade064Part01088 = 4017554558657642830103525475484129048925689660553405610991899397105815032358318655154337393451787257073253744640 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade064Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade064Part01152 = 3586422980122409186873041222652098691341955384790535458922513679065386595651084228380815587904188562801730519040 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade064Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade064Part01216 = 3094171714126923387873844210818971589655299509703271568879163750355726765160918960293728996649588054497314209792 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade064Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade064Part01280 = 2593852486308062333306932067116225115369681357980704007874742610186176906687485583092347634131600670562294169600 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade064Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade064Part01344 = 2121850548515501754590623313819083244080121967234664172665906709413440343600275137488845305296997835352108433408 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade064Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade064Part01408 = 1699617028499171287489070636120559159038338341518670608318594886825154394712868575421635330381849354492853616640 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade064Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade064Part01472 = 1337805807786951327692596740368792818734680432583524225850274815897800198814264162821702435669800464162811281408 := by decide +kernel

theorem group_length : firstCenterIntegerGrade064Group002.size = 512 := by
  simp only [firstCenterIntegerGrade064Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade064Group002 = 22780380117849043545033900323169468409061970004437400414130110143927892236060967451481744710185929329372798386176 := by
  simp only [firstCenterIntegerGrade064Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade064Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade064Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade064Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
