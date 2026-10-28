import Grothe.UpperChaos.TaylorFirstIntegerGrade028Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade028Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade028Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade028Part00000 = 1874381327963980384382403305171686573499568090978553128419418273635603482017388122401046883105344213723519014404096 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade028Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade028Part00064 = 795405498154644552308050503603367245839503325712957608435711959277655743821629934355945712526068831948604937601024 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade028Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade028Part00128 = 594379582217312012903877198653391486147701393524586646050196672614624154930026703012300558973083422389811890094080 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade028Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade028Part00192 = 305919848331301105485279119415562107409838238091345279950569164839976075134173365450492958475718852090551601201152 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade028Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade028Part00256 = 72115332262730952286260647635730568867609447547734812056994905217702235439186161992367188226541587446745607962624 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade028Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade028Part00320 = 31825118023877520089337077380885322819311614612829752269488873963262688030250971950701882372077879094849635876864 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade028Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade028Part00384 = 13375640014792224187179458168628743127253841838626051523876272147364736541917371458556351307886584243596287803392 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade028Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade028Part00448 = 5253063103115602317317433599762023988112412703635174154664386260908165731062639011870022081301663532562971099136 := by decide +kernel

theorem group_length : firstCenterIntegerGrade028Group000.size = 512 := by
  simp only [firstCenterIntegerGrade028Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade028Group000 = 3692655410071754353959704743629014071698898365010268452860920507957097281645635269633281557068023034470241946042368 := by
  simp only [firstCenterIntegerGrade028Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade028Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade028Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade028Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
