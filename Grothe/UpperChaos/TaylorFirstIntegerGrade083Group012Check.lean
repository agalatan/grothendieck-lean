import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group012Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade083Group012Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade083Part06144.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade083Part06144 = 9048598736329856691228900273911518115248133075789527033872318570685756275211177769450763258470156826836992 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade083Part06208.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade083Part06208 = 8168363641315237242971962057023354213813030786092520985675209951090195453916744054525504353940848980787200 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade083Part06272.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade083Part06272 = 17871711183957637313997779938460742612489083499586198852800889643233667885175803089531150230582718248255488 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade083Part06336.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade083Part06336 = 13627481873276521132162690437826072946937856119529645666839971072005182343043646715377856575197287093895168 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade083Part06400.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade083Part06400 = 11425903297105510433551883343026333058979483416382066752792712863846350027985604349610579276640741148852224 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade083Part06464.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade083Part06464 = 1347270151993940590358124911350919473458503903281955696322164602581674646891419403802283083485460889075712 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade083Part06528.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade083Part06528 = 10208479894095070523214921394705825858378782232147178812561239622080451332795173727004010545504321267564544 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade083Part06592.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade083Part06592 = 12414991211262532269016646175122639597078141531902448693065665678807842145756204996534051018904835446538240 := by decide +kernel

theorem group_length : firstCenterIntegerGrade083Group012.size = 512 := by
  simp only [firstCenterIntegerGrade083Group012, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade083Group012 = 84112799989336306196502908531427405876383014564711542493930172004331120110775774105836198342726369901805568 := by
  simp only [firstCenterIntegerGrade083Group012, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade083Group012Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group012Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group012Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
