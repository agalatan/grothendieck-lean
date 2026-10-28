import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade077Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade077Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade077Part00000 = 4072262857256768640071186721974781659017185907049113877833408410629371332747809937996059648554165854677246148608 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade077Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade077Part00064 = 5117964774319659034322044034292183276471271390618237713612646462413701189966097397009450284530805373318209732608 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade077Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade077Part00128 = 6649653813017425419395146295444298027557475083578095745958351354080293740767833154009229059599700794555165048832 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade077Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade077Part00192 = 6919559344438093405457761814168602131852310988603218276103690884059904518719557229819664797657527664942736474112 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade077Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade077Part00256 = 5862814253089146812208113005893674588379233653786228381642539115707987921262816113878506012346447809298317705216 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade077Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade077Part00320 = 944357399842012564403054481941820686370150410697856330300560868769845406137433708300594748857472422057422618624 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade077Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade077Part00384 = 6501622364106556546855585297359365411330204669066743936508027797840359020681983080156886685960635275987224887296 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade077Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade077Part00448 = 6009944209898759808872800888634506358480183608569312540150149233584974380253361657022616913861636307133495508992 := by decide +kernel

theorem group_length : firstCenterIntegerGrade077Group000.size = 512 := by
  simp only [firstCenterIntegerGrade077Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade077Group000 = 42078179015968422231585692539709232139458015711968806802109374127086437510536892278193008151368391501969818124288 := by
  simp only [firstCenterIntegerGrade077Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade077Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
