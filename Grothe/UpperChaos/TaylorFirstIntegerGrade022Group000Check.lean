import Grothe.UpperChaos.TaylorFirstIntegerGrade022Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade022Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade022Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade022Part00000 = 4089301895735797366125004532761893431238937277384082969400531813362931515093922408964851693364251695498954698391552 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade022Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade022Part00064 = 1822348374136204789628414885943171454417342915143901380156102494477363599776046078517118174855731435489690189299712 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade022Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade022Part00128 = 769911719631679261369987498549682497978451904689389015917221152948884200744762211080044304917583822248185536970752 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade022Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade022Part00192 = 57329798221922491470765009296669971378675136157403493600814875453212254252639225690813168014192187619527477952512 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade022Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade022Part00256 = 15570368582804315943514147545433009736986954895891148435113799337293648578091437864802043651067427744912112615424 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade022Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade022Part00320 = 5040181963131909125625257562044206934425782770542565286327614355926420625243458501785410148293264173758393876480 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade022Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade022Part00384 = 1745497912925217736662627366101295601575356554846475445554886803700035881086604471826766500689612662188172902400 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade022Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade022Part00448 = 1742736745849857302126869011459652707132591334335258196905941124027860218004258474689342468583514004861805920256 := by decide +kernel

theorem group_length : firstCenterIntegerGrade022Group000.size = 512 := by
  simp only [firstCenterIntegerGrade022Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade022Group000 = 6762990572930315208702100828036455519993527918930392306438572577863339535169795683565930903920392959442078387929088 := by
  simp only [firstCenterIntegerGrade022Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade022Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade022Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade022Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
