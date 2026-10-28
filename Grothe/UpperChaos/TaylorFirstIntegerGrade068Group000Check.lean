import Grothe.UpperChaos.TaylorFirstIntegerGrade068Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade068Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade068Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade068Part00000 = 17232387486182230227007104856802650754055252232747532041996353402401259992919551470550852401298478886996617986048 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade068Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade068Part00064 = 22265560701843933387031150815477175937120611581175793768944180357041744779999681824311004629043176260967558283264 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade068Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade068Part00128 = 28646489911163623532594387486369430751105740119079622292095146598429637568468965726420155902315285527441650483200 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade068Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade068Part00192 = 30331138396831642795016750239684758260785297184363963015683785037926759076714108383590490266848029286358052765696 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade068Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade068Part00256 = 29883368327760771134941914709755557591120949619385866769491725423972079599263152036158571293095857063192613093376 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade068Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade068Part00320 = 27362407008098653014488974045799721364693609408366702460757011132227512107613884516652524686761448766441470820352 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade068Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade068Part00384 = 23366946016279101877487949798860696700028772141237625587891767015377922764601206651628647909928927332375801626624 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade068Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade068Part00448 = 18761498791617108103201336027902332908806415673774528098143126892004543161905976696207517946371978347920326918144 := by decide +kernel

theorem group_length : firstCenterIntegerGrade068Group000.size = 512 := by
  simp only [firstCenterIntegerGrade068Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade068Group000 = 197849796639777064071769567980652324267716647960131634035003095859381459051486527305519765035663181471694091976704 := by
  simp only [firstCenterIntegerGrade068Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade068Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade068Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade068Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
