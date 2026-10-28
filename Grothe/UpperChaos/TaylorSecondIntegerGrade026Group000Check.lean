import Grothe.UpperChaos.TaylorSecondIntegerGrade026Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade026Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade026Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade026Part00000 = 4961868892144545403424649111099313127590721949573385552484933248554991973964439511975992342791215106578632933376 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade026Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade026Part00064 = 1770471930602493817228189323504784611720699175151249380130812687208926181548761995077553133686630836229988417536 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade026Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade026Part00128 = 912502411927167592041433915985488467119957328328074977804811067870812903146361270844593813519660391265101414400 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade026Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade026Part00192 = 592483962786449443881486694432425936601295002486599022438857253854485824986823933511481326879933045133117751296 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade026Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade026Part00256 = 549699095319894522672989292427208882114059845141204682399801819152697870856982221831097539137983256326356074496 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade026Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade026Part00320 = 374855180801829334645664885117705155745963962842353115579053625794449950181608816026119863722329456457321283584 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade026Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade026Part00384 = 266211819918367488279368733177451137174026255698895024017195936045780655991558856524005802362399953130635657216 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade026Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade026Part00448 = 142971742560074287807390463632645577285615584960593782502518367489213802884393718947689038664245103341441384448 := by decide +kernel

theorem group_length : secondCenterIntegerGrade026Group000.size = 512 := by
  simp only [secondCenterIntegerGrade026Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade026Group000 = 9571065036060821889981172419377022895352339104182355537357984005971359163560930324738532860764397148462594916352 := by
  simp only [secondCenterIntegerGrade026Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade026Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade026Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade026Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
