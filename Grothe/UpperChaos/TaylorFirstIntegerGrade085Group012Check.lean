import Grothe.UpperChaos.TaylorFirstIntegerGrade085Group012Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade085Group012Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade085Part06144.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade085Part06144 = 12985858776433406819230621049806095328787228620281588498107857674922819442007935542936927976384557297434624 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade085Part06208.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade085Part06208 = 11863720894863461407909922610479432102720113331738515815601511659555266434918082581505597192073481258270720 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade085Part06272.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade085Part06272 = 3315030999807826995767422092827058574608460231057124240373687874988276365038390288212385004277713709563904 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade085Part06336.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade085Part06336 = 13649754278789123961771867482142408416661448350853417685660594122214099382837560315108554828152286807588864 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade085Part06400.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade085Part06400 = 14874774058853652678279588646106378606037967395208173366275017092812401698872293660118657490105264458694656 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade085Part06464.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade085Part06464 = 8044706802233183542347048007237161277645554493432439650940706733603448253991341499783034565432024657559552 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade085Part06528.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade085Part06528 = 7406841305090641309447256370837845482959160459544119154588187719147477491170251528372471942677355737120768 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade085Part06592.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade085Part06592 = 16295407566748402264772102137147526721277262786841394355512986179694250501132324608582712884802361441124352 := by decide +kernel

theorem group_length : firstCenterIntegerGrade085Group012.size = 512 := by
  simp only [firstCenterIntegerGrade085Group012, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade085Group012 = 88436094682819698979525828396583906510697195668956772767060549056938039569968180024620341883905045367357440 := by
  simp only [firstCenterIntegerGrade085Group012, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade085Group012Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group012Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group012Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
