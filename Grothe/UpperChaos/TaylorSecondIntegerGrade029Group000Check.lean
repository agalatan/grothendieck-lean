import Grothe.UpperChaos.TaylorSecondIntegerGrade029Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade029Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade029Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade029Part00000 = 4416426041150684676756530296498740369114810306084163886375329234636152970213028791173700998217206497305081937920 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade029Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade029Part00064 = 1380075897886921035238724293780208424232976337571704297666117540319003146312377617499786741406550108999119798272 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade029Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade029Part00128 = 878708248306479378788750344789530967814569634144028296794257537393148098655380183444073692202157210092819185664 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade029Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade029Part00192 = 535175993672589436168584236191504411087304619195572407318009479604508081272059317500681826340746515617459208192 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade029Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade029Part00256 = 372104197635961644491581385797164565395393163679778086787853290554429724103615935066765281122484736594012012544 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade029Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade029Part00320 = 352563720676732517263843974359869253438370277900779614503746714368408613987730805995570118601666187386370916352 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade029Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade029Part00384 = 185804208471730916510165047192753816964766895755720591522568381814192031655083932925401049878990761328482713600 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade029Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade029Part00448 = 184166432600546797693449762492759163509324580820337941029357206018963722346625718341960225355843922109413720064 := by decide +kernel

theorem group_length : secondCenterIntegerGrade029Group000.size = 512 := by
  simp only [secondCenterIntegerGrade029Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade029Group000 = 8305024740401646402911629341102530971557515815152085121997239384708806388545902301947939933125645939432759492608 := by
  simp only [secondCenterIntegerGrade029Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade029Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade029Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade029Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
