import Grothe.UpperChaos.TaylorFirstIntegerGrade084Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade084Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade084Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade084Part00000 = 2373097877599122844339451173684733363498047025805823054760240239771192437458593670473261987240116027641477201920 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade084Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade084Part00064 = 2217564088212168416604244991410223497350113365188339683592187861444042102243585829115230555226336944295591804928 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade084Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade084Part00128 = 2335331061791933613031128308694010361025624971010121306525612635199854695146671941258827415289060341747749486592 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade084Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade084Part00192 = 86801264375929796724112595886009425258734830994077779295380143071547382368420976726057341129678201141585772544 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade084Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade084Part00256 = 2474597322215318078273703831061934147443084839569715023588219857383334161422175490647749103404987136713464741888 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade084Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade084Part00320 = 2698719931178184053294444743683313867181999435797562507833860610793126848357967999953188345890656752929913962496 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade084Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade084Part00384 = 2717396246248376925761778691440302359741861884897004895392188879373253873099308177182766856045611787821432963072 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade084Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade084Part00448 = 41824717307605766668539836013342581757234765495427999305920309053629768523237856866709337157155159750467387392 := by decide +kernel

theorem group_length : firstCenterIntegerGrade084Group000.size = 512 := by
  simp only [firstCenterIntegerGrade084Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade084Group000 = 14945332508928639494697404171873869603256701118758072250293610536089981268619961942223790941383602352041683320832 := by
  simp only [firstCenterIntegerGrade084Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade084Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
